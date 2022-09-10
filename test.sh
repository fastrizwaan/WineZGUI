#!/usr/bin/env bash
# ============================================================================ #
# WineZGUI (winezgui) (C) GPL3 Mohammed Asif Ali Rizvan <fast.rizwaan@gmail.com>
# URL: https://github.com/fastrizwaan/WineZGUI
# winezgui main program to run or create a wine prefix for a selected exe
# ============================================================================ #
#set -x
# Variables
export APPNAME=WineZGUI 

# These values will be assigned by Setup using sed command
# Post install ${PREFIX}/bin/winezgui file will be different
export DATADIR=/usr/share/winezgui # /usr will be replaced by prefix
export APPVERSION="git"
export APP_WITH_VER="${APPNAME}-${APPVERSION}"
export INSTALL_TYPE="system"
export WINEZPREFIX=$(realpath -m ~/.local/share/winezgui)
export FLATPAK_NAME="io.github.fastrizwaan.WineZGUI"
#/These values will be changed  by Setup using sed command

export UPDATE_ICON_CACHE="gtk-update-icon-cache -f --ignore-theme-index \
                          ~/.local/share/icons 2>/dev/null"
export UPDATE_DESKTOP_DATABASE="update-desktop-database"

export AUTHOR="Mohammed Asif Ali Rizvan"
export EMAIL="fast.rizwaan@gmail.com"
export COPYRIGHT="GNU General Public License (GPLv3)"
export WEBSITE="https://github.com/fastrizwaan/WineZGUI"
export PROCESSNAME="$0"
export WINEVER=$(wine --version|cut -f1 -d " ")

export TEMPLATES_DIR="${WINEZPREFIX}/Templates"
export DEFAULT_TEMPLATE="${WINEZPREFIX}/default" # This is going to be a shortcut
export WINE_TEMPLATE="${TEMPLATES_DIR}/wine" # This will be used 
export DEFAULT="${DEFAULT_TEMPLATE}"
export WINEARCH=win64
export LD_LIBRARY_PATH="/app/lib:/app/lib32:/app/lib64:\
                        /app/lib/i386-linux-gnu:/app/lib/wine:\
                        /app/lib64/wine:/app/${NAME}:$(pwd)"

export PATH=${PATH}:$(pwd)
export ARGV="$@"
export WINEPREFIX="${DEFAULT}"
export WINEEXE="$(which wine)"
export WINETRICKS="$(which winetricks)"
export WINE_CMD="${WINEEXE}"

export INFOFILE="${PREFIXDIR}/Info.yml"
export ABOUTFILE="About.yml"

export APPLICATIONSDIR="$(realpath -m ~/.local/share/applications)"
# Where to install .desktop shortcuts?
# for system install (./setup -i) use ~/.local/share/applications/winezgui
if [ "${INSTALL_TYPE}" = "system" ]; then
     export DESKTOPDIR="$(realpath -m ${APPLICATIONSDIR}/winezgui)"
else # for flatpak create subdirectory with flatpakname
     DESKTOPDIR="$(realpath -m ${APPLICATIONSDIR}/winezgui/${FLATPAK_NAME})"
     export DESKTOPDIR
fi


# winezgui backup file extension
export BKP_EXT="wzt"

# On launch check required runtime dependencies
if [ ! -f "${WINEZPREFIX}/DepsCheckOK.txt" ]; then
     # Function to print if dependencies are installed.
     FOUND=()    # Array/list to hold all found commands
     NOTFOUND=() # Array/list to hold all not found commands

     RUNTIME="wine winetricks icotool exiftool zenity wget"
     for i in ${RUNTIME} ; do
         if [ $(which $i) ]; then
                FOUND+="$i"
                FOUND+=" "
         else
                NOTFOUND+="$i"
                NOTFOUND+=" "
         fi
     done

     # Show found and not found dependencies for WineZGUI
     if [ ! -z "${NOTFOUND}" ]; then
          echo "Dependencies..."
          echo "Found    : ${FOUND}"
          echo "Not Found: ${NOTFOUND}"
          zenity --info --no-wrap --title="Missing Dependencies" \
                 --text="Please install these in your system:\n${NOTFOUND}"
     else
          mkdir -p "${WINEZPREFIX}"
          echo "Yes" > "${WINEZPREFIX}/DepsCheckOK.txt"
     fi
fi

# Create Template Directory
mkdir -p "${TEMPLATES_DIR}"

INITIALIZE_WINEPREFIX()
{
   if [ ! -f ${1}/ReplacedSymLinks.txt ] && \
      [ $(which wine) ]
        then
        echo "I: Startup: Initializing wine Prefix... PREFIX arch is ${WINEARCH}"
        # Create Prefix then delete host linked directories
        WINEDLLOVERRIDES="mscoree,mshtml=" \
        WINEPREFIX=${1} \
        WINEDEBUG=-all \
        wineboot -i 2>/dev/null

        # Replace home liked directory links with normal directories
        # For Games which saves in ~/Documents now will save in
        # Prefix-dir/drive_c/users/${USER}/Documents
        SAVEIFS=${IFS}
        IFS=$(echo -en "\n\b")

        echo "I: Startup: Removing symlinks from wineprefix"

        for i in $(find "${1}/drive_c/users/${USER}" -type l); do
                   rm $i && mkdir -p $i && \
                   echo $i >> ${1}/ReplacedSymLinks.txt
        done
        IFS=${SAVEIFS}

        # Create an empty file to test whether prefix is created
        touch ${1}/ReplacedSymLinks.txt
        echo "I: Startup: Default Wine Prefix at ${1} Created"

        # Create H: for HOME Directory for Wine Explorer
        ln -sf ${HOME} "${1}/dosdevices/h:"
        echo "I: Startup: Created H: symlink to ${HOME}"
   fi


    ### End of Create a default wine prefix directory ###


# Create Metadata Info.yml for the default wine prefix
# Update info only when wine is found
if [ ! -f "${WINEZPREFIX}/${ABOUTFILE}" ] && [ $(which wine) ]; then
echo -e   "
Application     : ${APPNAME}
Version         : ${APPVERSION}
Copyright       : ${COPYRIGHT}
Website         : ${WEBSITE}
Author          : ${AUTHOR}
E-mail          : ${EMAIL}
Wine            : ${WINEEXE}
Wine Version    : ${WINEVER}
Wine Arch       : ${WINEARCH}
WineZGUI Prefix : ${WINEZPREFIX}
Wine Prefix     : ${DEFAULT}
Creation Date   : $(date)
" > "${WINEZPREFIX}/${ABOUTFILE}"
echo "I: Startup: Created ${WINEZPREFIX}/${ABOUTFILE}"
fi
}

TEMPLATE_IN_USE="$(realpath -m ${DEFAULT})"
TEMPLATE_NAME="$(basename $(realpath -m ${DEFAULT}))"
# Create wine template and link it to defaults
if [ ! -d "${WINE_TEMPLATE}" ]; then
      INITIALIZE_WINEPREFIX "${WINE_TEMPLATE}"
fi

# if default link is broken then create link do wine_template
find ${TEMPLATES_DIR} -maxdepth 1 -xtype l -delete

if [ ! -L "${DEFAULT_TEMPLATE}" ]; then
     echo "Could not find default template, using wine_template"
     rm -rf "${DEFAULT_TEMPLATE}" # Delete if existing default directory exist
     ln -sf "${WINE_TEMPLATE}" "${DEFAULT_TEMPLATE}"
fi

# Preprocessing files for Backup and Restore Function
# include backup and restore preprocess function
# which can be used both by default prefix and game prefix script
# Backup_Restore_Function()
source ${DATADIR}/winezgui-backup-restore-function
source ${DATADIR}/winezgui-restore-wzt


    # Main WineZGUI application window function
    Main_Function ()
    {
      SELECTION=$( \
      zenity --title "${APP_WITH_VER}" \
             --list   --hide-header                             \
             --width=360 --height=420                           \
             --radiolist --column " "                           \
             --column "Action"                                  \
                 TRUE "Open EXE..."                             \
                    0 "About..."                                \
                    0 "Quit..."                                 \
             --text   "<b>Wine GUI using Zenity...</b>" \
              )

      # Exit if Cancel is clicked
      if [ -z "${SELECTION}" ]
           then
           echo "I: Cancel Selected. Bye!"
           exit 0
      fi


      # Open EXE... Opens file dialog
      if [ "${SELECTION}" = "Open EXE..." ]
           then
           echo "I: Open EXE... Selected!"
           unset EXE_FILE
      	    EXE_FILE="$( zenity                  \
      	                --file-filter="*.exe *.msi" \
      	                --file-selection        \
      	                --title="Select a File" \
      	              )"

      	   # If no exe is selected
      	   if [ -z "${EXE_FILE}" ];  then
      	        echo "I: Open EXE... Cancelled!"
      	        Main_Function    ; # Go back to Main Window
      	   fi

          # 2.3 if User selects cancel / no
          if [ "$ANSWER" = "0" ]; then
              echo "I: ****** ***** Open Exe:\"${EXE_FILE}\" Selected!";
              export EXE_FILE
              OPEN_EXE_FUNCTION
          fi

          if [ "$ANSWER" = "1" ]; then
              echo "I: ANSWER = 1 Cancelled!"
              unset EXE_FILE
              Main_Function
          fi

        # ====================== About ================================== #
      elif [ "${SELECTION}" = "About..." ]; then
             echo "I: About... Selected!"
             # Text is more, so we need to format it, with sed in pango markup
             ZCMD="zenity --info --no-wrap --text"
             ${ZCMD} "$(cat ${WINEZPREFIX}/${ABOUTFILE} | \
                      sed -E "s/^(.*: )/<tt><b>\1<\/b><\/tt>/g" | \
                      sed -E "s/^(.*)$/<small>\1<\/small>/g")"
             Main_Function
      # ====================== Open Explorer ========================== #
      elif [ "${SELECTION}" = "Quit..." ]
             then
             echo "I: Quit Selected..."
             echo "I: Bye!"
             exit 0
      else
            echo "W: Unknown selection = ${SELECTION}"
            exit 1

      fi


    } # End of Main_Function
  # END of "Start WineZGUI when no argument is supplied" section

#------------------------------- Startup -----------------------------#
  # on launch, if no argument is provided
  if [ $# -eq 0  ]
       then
       # info
       echo "I: Startup: No arguments supplied..."

  else

       echo "I: Startup: Checking ${EXE_FILE}"
       EXE_FILE="$(realpath -m "$1")"
       EXE_NAME=$(basename "${EXE_FILE}")
       EXE_PATH=$(dirname  "${EXE_FILE}")
       EXE_NOSP=$(echo ${EXE_NAME}|tr " " "_");
       EXE_NOEXE=$(echo ${EXE_NOSP}|sed "s/\.[Ee][Xx][Ee]//" \
                                   |sed "s/\.[Mm][Ss][Ii]//")
       EXE_EXT="${EXE_FILE##*.}"
       WINEPREFIX_SUBDIR="${WINEZPREFIX}/${EXE_NOEXE}"

       # some games need to cd to the dir to work
       export base=$(basename "$1")
       export dire=$(dirname  "$1")

       # if arugment is not an exe file, then quit
       IS_EXE="$(echo ${EXE_EXT}|tr A-Z a-z)"

       # Check if the argument is exe or msi or wzt
       if [ "${IS_EXE}" != "exe" ] && \
          [ "${IS_EXE}" != "msi" ] && \
          [ "${IS_EXE}" != "wzt" ] ; then

            echo "W: Startup:  \"${EXE_NAME}\" is not an EXE file"
            echo "I: Startup:  Please provide a .exe, .msi, or .wzt file as argument"
            echo "I: Startup:  Exiting..."
            exit 1
       fi
  fi

## On 1st launch create default wine prefix
### Create a default wine prefix directory ###
   if ! [ -d "${WINE_TEMPLATE}" ]; then
        echo "I: Startup: ${WINE_TEMPLATE} does not exist, creating.."
        mkdir -p "${WINE_TEMPLATE}"
   fi
   # Wine creates some dirs which are linked to directories inside user home
   # To prevent games/programs from writing to host ~/Documents
   # and to allow sandbox backup we need to remove the links
   # and create normal directories inside wine prefix

   # Check if default prefix was created and symlinks removed
   # and create prefix only when wine is found

# If an exe file is provided as argument or selected by the Open EXE...
# TODO: list all available prefixes to install Redist softwares
# ====================== Open EXE ================================= #
OPEN_EXE_FUNCTION(){
if [ -f "${EXE_FILE}"  ] ; then

     if [ "${IS_EXE}" = "wzt" ]; then
          export WZT_FILE="${EXE_FILE}"
          echo "I: Startup: WineZGUI Backup file submitted"
          RESTORE_WZT_FILE
          echo "I: Startup: Exiting main program after restoring backup"
          exit 0;
     fi
     echo "I: Open EXE: exe is ${EXE_FILE}"
     # Prompt to Launch exe with default or existing Prefix of that exe
     EXE_FILE=$(realpath -m "${EXE_FILE}")
     EXE_NAME=$(basename "${EXE_FILE}")
     EXE_PATH=$(dirname  "${EXE_FILE}")
     EXE_NOSP=$(echo ${EXE_NAME}|tr " " "_");
     EXE_NOEXE=$(echo ${EXE_NOSP}|sed "s/\.[Ee][Xx][Ee]//" \
                                 |sed "s/\.[Mm][Ss][Ii]//")
     EXE_EXT="${EXE_FILE##*.}"
     WINEPREFIX_SUBDIR="${WINEZPREFIX}/${EXE_NOEXE}"

     # If existing prefix exists for the exe
     if [ -f  ${WINEZPREFIX}/${EXE_NOEXE}/"${EXE_NOEXE}.sh" ]
          then
          echo "I: Open EXE: ${EXE_NAME}: Existing Prefix found for the exe!" \
               "Launching..."
          ${WINEPREFIX_SUBDIR}/"${EXE_NOEXE}.sh"
#          SELECTION=$( \
#          zenity \
#          --title "${APPNAME} (${WINEVER})" \
#          --width=500 --height=300 \
#          --list \
#          --radiolist --column " " \
#          --column "Action"                                             \
#                 0 "Run with Default Prefix..."               \
#              TRUE "Run ${EXE_NAME} with existing ${EXE_NOEXE} Prefix"  \
#                 0 "Run ${EXE_NAME} configuration"                      \
#            --text "Select Action for ${EXE_NAME} " )
     else
          echo "I: Open EXE: ${EXE_NAME}: No Prefix! Create a prefix or Run?"
          CHOOSE_ACTION=$(zenity  --title "${APP_WITH_VER}"             \
                              --width=500 --height=300              \
                              --list  --hide-header                 \
                              --radiolist --column " "              \
                              --column "Action"                     \
                                  TRUE "Create Prefix..."           \
                                  0    "Run with Default Prefix..." \
                                --text "<b>${EXE_NAME}...</b>" )
     fi

     # Exit if Cancel is clicked go back to main menu
     if [ -z "${CHOOSE_ACTION}" ]
          then
          echo "I: Open EXE: Cancelled!"
          unset SELECTION
          Main_Function

     fi
############ FIXME: Opening, exe, cancelling, reopening quits winezgui ####
     # If exe prefix (already created prefix for the exe) does not exist
     if [ "${CHOOSE_ACTION}" = "Run with Default Prefix..." ]
          then
          cd "${EXE_PATH}" 2>/dev/null; # Go to the exe directory then run
          echo "I: Open EXE: Running EXE with default prefix"
          echo "I: Open EXE: Launching ${EXE_NAME}!"
          echo "W: Open EXE: ${APPNAME} exits!"
          WINEPREFIX=${DEFAULT} ${WINE_CMD} "${EXE_NAME}" # "$@"

     # Create Prefix for the selected EXE
     elif [ "${CHOOSE_ACTION}" = "Create Prefix..." ]
            then
            echo "I: Open EXE: Creating Prefix for ${EXE_FILE}"
            ${DATADIR}/winezgui-create-prefix "${EXE_FILE}"
          	# Launch after creating new prefix
            echo "I: Open EXE: Created Script:" \
                 "${WINEPREFIX_SUBDIR}/${EXE_NOEXE}.sh"
            echo "I: Open EXE: Created Script: Launching ${EXE_NOEXE}.sh"
          	${WINEPREFIX_SUBDIR}/"${EXE_NOEXE}.sh"

#	   # Run with existing exe prefix?
#     elif [ "${SELECTION}" = \
#            "Run ${EXE_NAME} with existing ${EXE_NOEXE} Prefix" ]
#            then
#            echo "I: Open EXE: Launching \"${EXE_NOEXE}.sh\""
#	          ${WINEPREFIX_SUBDIR}/"${EXE_NOEXE}.sh" "launch"

#     # Show exe prefix configuration
#     elif [ "${SELECTION}" = "Run ${EXE_NAME} configuration" ]
#            then
#            echo "I: Open EXE: Launching Config Script \"${EXE_NOEXE}.sh\""
#            ${WINEPREFIX_SUBDIR}/"${EXE_NOEXE}.sh"
     else
     ############ FIXME: Opening, exe, cancelling, reopening other exe quits winezgui ####
          echo "I: Open EXE: Bye!"
          echo "I am in the else of Open EXE function"
          Main_Function
     fi
fi
}

# Initialize Wineprefix for use
INITIALIZE_WINEPREFIX "${WINE_TEMPLATE}"

# Start WineZGUI when no argument is supplied
if [ $# -eq 0 ]
     then
     echo "I: Startup: Launching WineZGUI"
     Main_Function
fi
# Open exe function handles exe argument
OPEN_EXE_FUNCTION
