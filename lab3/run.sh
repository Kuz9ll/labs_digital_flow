#!/bin/bash

# ##################
# source ./data/s38584_cadence_env/design_env.sh
source ./data/actual_env.sh

# ##################

help_info() {

YELLOW='\033[33m'
NC='\033[0m' # No Color

echo -e "
${YELLOW}

$(cat ReadMe)

${NC}
"


}

clear_info() {

YELLOW='\033[33m'
NC='\033[0m' # No Color

echo -e "
${YELLOW}
##############################################
../implementation direcrory clear
##############################################
${NC}
"

}

if [ $# -eq 0 ]; then
    help_info
    exit 1
fi

incase=0
suffix=""
default_date=$(date +"%Y_%m_%d")


process_suffix() {
    if [ "$1" = "-suffix" ] || [ "$1" = "-s" ]; then
        if [ -n "$2" ]; then
            suffix=".$2"
            return 2  
        else
            echo "Error: Suffix value is missing"
            exit 1
        fi
    fi
    return 0
}

while [ -n "$1" ]
do
    case "$1" in 
    -clear)       
        rm -r ./implementation/*
        clear_info
        exit 0
        ;;
    -genus)  
        
        if [ "$2" = "-suffix" ] || [ "$2" = "-s" ]; then
            process_suffix "$2" "$3"
            shift 2
        else
            
            suffix=".$default_date"
        fi
        run_dir="./implementation/genus.empty${suffix}"
        mkdir -p ${run_dir}
        cd ${run_dir}
        genus 
        incase=1 
        ;;
    -genus.syn)  
        
        if [ "$2" = "-suffix" ] || [ "$2" = "-s" ]; then
            process_suffix "$2" "$3"
            shift 2
        else
            
            suffix=".$default_date"
        fi
        run_dir="./implementation/genus.syn${suffix}"
        mkdir -p ${run_dir}
        cd ${run_dir}
        genus -files ../../../flow_scripts/genus.syn.tcl
        incase=1 
        ;;    
    -innovus)  
        
        if [ "$2" = "-suffix" ] || [ "$2" = "-s" ]; then
            process_suffix "$2" "$3"
            shift 2
        else
            
            suffix=".$default_date"
        fi
        run_dir="./implementation/innovus.empty${suffix}"
        mkdir -p ${run_dir}
        cd ${run_dir}
        innovus -stylus -overwrite
        incase=1 
        ;;
    -innovus.fp)  
        
        if [ "$2" = "-suffix" ] || [ "$2" = "-s" ]; then
            process_suffix "$2" "$3"
            shift 2
        else
            
            suffix=".$default_date"
        fi
        run_dir="./implementation/innovus.fp${suffix}"
        mkdir -p ${run_dir}
        cd ${run_dir}
        innovus -stylus -overwrite -files ../../../flow_scripts/innovus.fp.tcl
        incase=1 
        ;;
    -innovus.impl)  
        
        if [ "$2" = "-suffix" ] || [ "$2" = "-s" ]; then
            process_suffix "$2" "$3"
            shift 2
        else
            
            suffix=".$default_date"
        fi
        run_dir="./implementation/innovus.impl${suffix}"
        rm -r $run_dir      
        mkdir -p ${run_dir}
        cd ${run_dir}
        innovus -stylus -overwrite -files ../../../flow_scripts/innovus.impl.tcl
        incase=1 
        ;;
       *)          
        echo "Error: Unknown option '$1'"
        help_info
        exit 1
        ;;
    esac

    if [[ $incase == 1 ]]; then
        shift 1
    else
        help_info
        exit 1
    fi
    incase=0
done