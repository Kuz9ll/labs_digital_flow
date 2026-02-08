#! /bin/bash

##############################################################
#   ____ ___  __  __ __  __  ___  _   _ 
#  / ___/ _ \|  \/  |  \/  |/ _ \| \ | |
# | |  | | | | |\/| | |\/| | | | |  \| |
# | |__| |_| | |  | | |  | | |_| | |\  |
#  \____\___/|_|  |_|_|  |_|\___/|_| \_|
#                                       
##############################################################                                

export ENV_DIR="./data/s38584_cadence_env/"
export PROJECT="./data/s38584_cadence_env/rtl/"



export ENV_DESIGN="s38584"

export ENV_LEF_FILES=" 
${ENV_DIR}../../../PDK/IHP_Open_PDK/sg13g2_stdcell/lef/sg13g2_tech.lef
${ENV_DIR}../../../PDK/IHP_Open_PDK/sg13g2_stdcell/lef/sg13g2_stdcell.lef
"

export ENV_MMMC="${ENV_DIR}mmmc.view"

##############################################################
#   ____ _____ _   _ _   _ ____  
#  / ___| ____| \ | | | | / ___| 
# | |  _|  _| |  \| | | | \___ \ 
# | |_| | |___| |\  | |_| |___) |
#  \____|_____|_| \_|\___/|____/ 
#
##############################################################                                

export ENV_RTL_LIST="
${PROJECT}s38584.lst
"

export ENV_INIT_HDL_SEARCH_PATH="" 
export ENV_DEFINE=""



##############################################################
YELLOW='\033[33m'
NC='\033[0m' # No Color

echo -e "
${YELLOW}

Read design environment...

${NC}
"

