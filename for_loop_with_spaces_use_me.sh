ln -sf ~/.var/app/io.github.WineZGUI/data/applications/wine/Programs/ ~/.local/share/applications/winezgui/io.github.winezgui-Programs
 
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
# do a Sed 
for i in $(find ~/.var/app/io.github.WineZGUI/data/applications/wine/Programs \
           -iname "*.desktop"); do 

echo \"$i\"; 
sed -E 's/ wine C(.*$)/ wine "C\1"/g' -i "$i"
sed 's/\\\\ / /g' -i "$i"
sed 's/\\\\\\\\/\\/g' -i "$i"
sed 's/wine "C/flatpak run --command=wine io.github.WineZGUI start \/unix "C/g'\
    -i "$i"
done
       
IFS=$SAVEIFS



#####
#cat "/home/rizvan/.var/app/io.github.WineZGUI/data/applications/wine/Programs/Angel Writer/Angel Writer.desktop"|sed -E 's/ wine C(.*$)/ wine "C\1"/g'|sed 's/\\\\ / /g'|sed 's/\\\\\\\\/\\/g'


