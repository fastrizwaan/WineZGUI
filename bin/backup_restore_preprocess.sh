PROCESS_FILES_FOR_BACKUP()
{
  unset SEARCH
  unset REPLACE
  #  Paths needs flatpak/host specific replacement
  if [ "${INSTALL_TYPE}" = "flatpak" ]; then
      SEARCH=("\.var\\\\\\\\app\\\\\\\\${FLATPAK_ID}\\\\\\\\config")
  else
      SEARCH=("\\\\\\\\?\\\\\\H:\\\\\\\\\.config")
  fi
  REPLACE=("XOCONFIGXO")
  
  if [ "${INSTALL_TYPE}" = "flatpak" ]; then
     SEARCH+=("\/home\/${USER}\/\.var\/app\/${FLATPAK_ID}\/data\/prefixes")
  else
     SEARCH+=("\/home\/${USER}\/\.local\/share\/winezgui")
  fi
  REPLACE+=("XOPREFIXXO")
  
  if [ "${INSTALL_TYPE}" = "flatpak" ]; then
      SEARCH+=("\.var\\\\\\\\app\\\\\\\\${FLATPAK_ID}\\\\\\\\data\\\\\\\\applications")
  else
      SEARCH+=("\.local\\\\\\\\share\\\\\\\\applications")
  fi
  REPLACE+=("XOAPPLICATIONSXO")
  
# Variables 
  SEARCH+=("${WINEEXE}")
  REPLACE+=("XOWINEEXEXO")

  SEARCH+=("${WINEVER}")
  REPLACE+=("XOWINEVERXO")

  SEARCH+=("${USER}")
  REPLACE+=("XOUSERXO")

  SEARCH+=("${FLATPAK_ID}")
  REPLACE+=("XOFLATPAKIDXO")

  len=${#SEARCH[@]}

  # By default process
  if [ "$1" = "restore" ]; then
        echo "Restoring preprocessed variables"
        for (( i=0; i <$len; i++ ))
            do
            echo "Replacing: ${REPLACE[$i]} with ${SEARCH[$i]}"
            sed "s|${REPLACE[$i]}|${SEARCH[$i]}|g" -i ${BACKUPNAME}/*.reg
            sed "s|${REPLACE[$i]}|${SEARCH[$i]}|g" -i ${BACKUPNAME}/*.txt
            sed "s|${REPLACE[$i]}|${SEARCH[$i]}|g" -i ${BACKUPNAME}/*.desktop
        done
  else
        echo "Processing Registry and Info files"
        for (( i=0; i <$len; i++ ))
        do
           echo "Replacing: ${SEARCH[$i]} with ${REPLACE[$i]}"
           sed "s|${SEARCH[$i]}|${REPLACE[$i]}|g" -i ${BACKUPNAME}/*.reg
           sed "s|${SEARCH[$i]}|${REPLACE[$i]}|g" -i ${BACKUPNAME}/*.txt
           sed "s|${REPLACE[$i]}|${SEARCH[$i]}|g" -i ${BACKUPNAME}/*.desktop
        done
  fi
}
