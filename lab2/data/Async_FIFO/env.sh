#! /bin/bash

##############################################################
#   ____ ___  __  __ __  __  ___  _   _ 
#  / ___/ _ \|  \/  |  \/  |/ _ \| \ | |
# | |  | | | | |\/| | |\/| | | | |  \| |
# | |__| |_| | |  | | |  | | |_| | |\  |
#  \____\___/|_|  |_|_|  |_|\___/|_| \_|
#                                       
##############################################################                                

export ENV_DIR="/home/p.kuzmin/labs_digital_flow/lab2/data/Async_FIFO/"
export PROJECT="${ENV_DIR}rtl/"
export ENV_FLOW_SCRIPTS="${ENV_DIR}../../../flow_scripts/"


export ENV_DESIGN="top_fifo"


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

export ENV_RTL_LIST="${PROJECT}async_fifo.list"

export ENV_INIT_HDL_SEARCH_PATH="" 
export ENV_DEFINE=""


##############################################################
# INNOVUS
##############################################################                                

export ENV_NETLIST="${ENV_DIR}../../implementation/genus.syn.asinc_fifo/syn_opt/out/async_fifo.v" 

export ENV_FLOORPLAN_FILE="${ENV_DIR}../../data/Async_FIFO/floorplan/async_fifo.fp" 

export ENV_POWER_NETS="VDD"
export ENV_GROUND_NETS="VSS"

export ENV_FILLER_CELLS=""

##############################################################
YELLOW='\033[33m'
NC='\033[0m' # No Color

echo -e "
${YELLOW}

Read design environment...

${NC}
"

