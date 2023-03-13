#winezgui-update-all-scripts
winezgui-update-all-scripts()
{ 
  clear
  c=0
  echo "$c,$c,$c,$c,$c,$c,$c"; c=$(expr $c + 1)
  
  OLD_HEADER=${HEADER}
  DBUG "I: $(basename ${0}): Launched ${FUNCNAME[0]}"
  #zenity --info --text="Work in Progress"
  #return 0  
  #source "${DATADIR}/script-check-variables-loaded-or-not"
  #Script_Check_Variables_Loaded_Or_Not
  
  echo "-=-=-=-=-=-=-=-=-=-=-=-=- LAUNCHED  ${FUNCNAME[0]} -=-=-=-=-=-=-=-=-=-=-=-=-"
  HEADER="$(basename ${0}): ${FUNCNAME[0]}"
  unset PFX PREFIXES_FOUND COMMAND count SHOW_OPTION
  unset NAMES FILES RESULT SEARCH_LIST RealFile RealName i
  
  #echo "count+1
  count=0
  NAMES=()
  FILES=()
  #echo "-----------------------------"
  SAVEIFS=${IFS}
  IFS=$(echo -en "\n\b")
  SEARCH_LIST=$(find ${PREFIXES_DIR}/* -maxdepth 0 -type d -print 2>/dev/null| tr '\n' '|')
  PREFIXES_FOUND=$(echo ${SEARCH_LIST})

  #source ${DATADIR}/check-all-variables
 # check-all-variables "SEARCH_LIST PREFIXES_FOUND"
  ### Get Prefixdir name
  #DBUG "I: $(basename ${0}): Launched ${FUNCNAME[0]}"

  for PFX in $(echo ${PREFIXES_FOUND}|tr '|' '\n'|sort);
  do
    echo "$c,$c,$c,$c,$c,$c,$c"; c=$(expr $c + 1)
    export SELECTED_PREFIX=${PFX}

    echo \
    "APPVERSION=$APPVERSION
    PREFIXES_DIR=$PREFIXES_DIR
    SEARCH_LIST=$SEARCH_LIST
    PREFIXES_FOUND=$PREFIXES_FOUND
    PREFIXNAME=$PREFIXNAME
    PFX=$PFX
    SELECTED_PREFIX=$SELECTED_PREFIX"

    #${ZENITY_CMD} --question --title="Recreate All Scripts for ${PREFIXNAME}?" \
    #              --text="This will overwrite all shell scripts associated with this prefix!"
    
    #ANSWER=$?

    #if [ ${ANSWER} -eq 1 ]; then
    #     echo "Cancelled"
    #     return 1
    #fi

    #echo "------------------------------winezgui-update-all-scripts-----------------------"
    #export PREFIXDIR="${PFX}"
    #echo "${PREFIXDIR} = ${PFX}"
    #find ${PREFIXDIR} -maxdepth 1 -iname "*.sh" -type f -print
    # Do not recreate _other.sh (smaller scripts)
    search_list=$(find "${PREFIXDIR}" -maxdepth 1 -iname "*.sh" -type f -print \
                    2>/dev/null| sed "/_other.sh/d"| tr '\n' '|')
      scripts_found=$(echo ${search_list})

    echo "search_list = $search_list"
    echo "scripts_found = $scripts_found"


    if [ -z "${scripts_found}" ] ; then
          ${ZENITY_CMD} --error --title "${APP_WITH_VER} - Prefix!" \
                --text "Prefixes directory empty.\nUse \"Open exe...\" to install!"
          continue
    fi
    # if scripts_found has value, then only change exe
    echo "going for for loop -------------------------------------------------------------------"
    for i in $(echo ${search_list}|tr '|' '\n'|sort);
    do
      echo "......i is ${i}....."
      PROGNAME=$(grep -i "export PROGNAME=" ${i}|cut -f2 -d "="|sed 's/"//g')
      export PROGNAME
      EXE_IN_SCRIPTFILE=$(grep -i "export EXE_FILE=" ${i}|cut -f2 -d "="|sed 's/"//g')
      echo "Found EXE= ${EXE_IN_SCRIPTFILE}"
      # rename .desktop and script file to .bak
      DESKTOP_FILE="$(echo "${i}"|sed "s/\.sh//g").desktop"
      APP_CATEGORY=$(grep "Categories=" "${DESKTOP_FILE}"|cut -f2 -d "="|sed "s/;$//g")
      echo "DESKTOP_FILE = $DESKTOP_FILE"
      export APP_CATEGORY
    echo "PROGNAME=$PROGNAME"
    echo "EXE_IN_SCRIPTFILE=$EXE_IN_SCRIPTFILE"
    echo "DESKTOP_FILE=$DESKTOP_FILE"
    echo "APP_CATEGORY=$APP_CATEGORY"
    
    #  mv -v "${DESKTOP_FILE}" "${DESKTOP_FILE}.bak"
    #  mv -v "${i}" "${i}.bak"
      
    #  ${DATADIR}/winezgui-recreate-prefix-script "${EXE_IN_SCRIPTFILE}"
    #check-all-variables "PROGNAME EXE_IN_SCRIPTFILE EXE_FILE DESKTOP_FILE APP_CATEGORY"

    echo "sleeping...5"
    sleep 5s;
    done
  IFS=${SAVEIFS}
  
  done
  # Clean up broken shortcuts and update shortcuts menu
  source "${DATADIR}/winezgui-remove-broken-links" 2>/dev/null || \
  source "${WINEZGUI_SCRIPTS}/winezgui-remove-broken-links"
  WineZGUI_Remove_Broken_Links
  
  # Inform and offer to Launch
  ${ZENITY_CMD} --info --title="Re-created Scripts for ${PREFIXNAME}" \
  --text="Updated scripts to $APP_WITH_VER version, Please launch from menu."

}
