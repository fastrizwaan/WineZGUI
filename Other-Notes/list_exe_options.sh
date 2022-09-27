#FOUND_EXE=$(find . -name windows -prune -o -name iexplore.exe -o \
#                   -name wordpad.exe -o -name wmplayer.exe -prune -o \
#                   -iname '*.exe' -a -type f -print)
#echo "------------------"
#echo ${FOUND_EXE}
#echo "------------------"
#unset OPTIONS
#for i in ${FOUND_EXE}; do
#    OPTIONS+="0 \"${i}\""
#done

# If Sha256sum exists in wine5, wine7 and wine8, we only want from wine7 and exclue wine5 and wine8

#find . -name "wine5" -prune -o \
#       -name "wine8" -prune -o \
#       -iname "sha256sum" -a -type f -print

IFS=$(echo -en "\n\b")
# Exclue windows directory, and common exe files in Program Files directory
count=0
Selection=()
Associate=()
for i in $(find ${PREFIXDIR} \
               -name windows -prune -o \
               -name iexplore.exe   -o \
               -name wordpad.exe    -o \
               -name wmplayer.exe   -o \
               -iname '*.exe' -a -type f -print)
do
    RealName=$(basename "$i")
    RealFile=$(realpath -m "$i")
    
    # If 1st value is empty, enable it
    if [ -z "${OPTIONS}" ]; then
         OPTIONS+="TRUE \"${RealName}\""
         OPTIONS+=" "
         Selection+=("${RealName}")
         Associate+=("${RealFile}")
    else
         OPTIONS+="0 \"${RealName}\""
         OPTIONS+=" "
         Selection+=("${RealName}")
         Associate+=("${RealFile}")
    fi
    count=$(expr ${count} + 1)
done
IFS=${SAVEIFS}
unset COMMAND
COMMAND+="zenity --title=\"Found EXE\" --radiolist --list --column \" \""
COMMAND+=" --column \"Action\" $OPTIONS"
EXE_SELECTION=$(eval ${COMMAND})
count=0
for i in "${Selection[@]}"; do 
    if [ "$i" = "$EXE_SELECTION" ]; then
         echo "==========================="
         echo "Selected $i"
         echo "File is ${Associate[${count}]}"
         echo "==========================="
    fi
    count=$(expr ${count} + 1)
done

