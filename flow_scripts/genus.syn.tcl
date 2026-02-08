
if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"

####################################################################################################
#### OPTIONS
####################################################################################################


#### optional

set_db timing_report_time_unit "ns"
set_db max_cpus_per_server 8 

set_db syn_generic_effort medium
set_db syn_map_effort medium 
set_db syn_opt_effort medium 

set_db information_level 1 

set_db tns_opto true 
#set_db hdl_unconnected_value "none"
#set_db optimize_constant_0_flops false

# suspend


set_db init_hdl_search_path $::env(ENV_INIT_HDL_SEARCH_PATH)

####################################################################################################
#### Setup design
####################################################################################################
set flow "genus.syn"
set DESIGN $::env(ENV_DESIGN)
set run_dir .


puts "Now load RTL LIST"
set rtlList $::env(ENV_RTL_LIST)

 

## Reading in MMMC defination file and lef files
read_mmmc $::env(ENV_MMMC) 
read_physical -lefs $::env(ENV_LEF_FILES)


# Reading hdl files, initialize the database and elaborating them
# suspend
# read_hdl -sv $rtlList

foreach file $rtlList {
    read_hdl -define $::env(ENV_DEFINE) -language sv -f $file
}
    

elaborate $DESIGN

init_design
check_design -unresolved > ${run_dir}/check_design.rpt
check_timing_intent > ${run_dir}/check_timing_intent.rpt

####################################################################################################
## Synthesizing the design
####################################################################################################

proc user_reports {} {
   upvar STAGE STAGE
   upvar run_dir run_dir
   upvar flow flow
   
   report_timing 			> ${run_dir}/${STAGE}/reports/report_timing.rpt
   report_power  			> ${run_dir}/${STAGE}/reports/report_power.rpt
   report_area   			> ${run_dir}/${STAGE}/reports/report_area.rpt
   report_qor    			> ${run_dir}/${STAGE}/reports/report_qor.rpt
   report_hierarchy 			> ${run_dir}/${STAGE}/reports/report_hierarchy.rpt
   report_timing_summary 		> ${run_dir}/${STAGE}/reports/report_timing_summary.rpt

}

proc user_out {} {
   upvar STAGE STAGE
   upvar run_dir run_dir
   upvar DESIGN DESIGN
   upvar flow flow
   
   write_hdl > ${run_dir}/${STAGE}/out/${DESIGN}.v
   write_db -to_file ${run_dir}/${STAGE}/out/${DESIGN}.db

   
}

#suspend
#resume

puts "\033\]2;[file tail $env(PWD)] - [set STAGE "syn_generic"] [clock format [clock seconds] -format "%R   %d / %m / %C%y"]\a"
syn_generic
user_reports
user_out


puts "\033\]2;[file tail $env(PWD)] - [set STAGE "syn_map"] [clock format [clock seconds] -format "%R   %d / %m / %C%y"]\a"
syn_map
user_reports
user_out

puts "\033\]2;[file tail $env(PWD)] - [set STAGE "syn_opt"] [clock format [clock seconds] -format "%R   %d / %m / %C%y"]\a"
syn_opt
user_reports
user_out
write_do_lec -golden_design rtl -revised_design ${run_dir}/${STAGE}/out/${DESIGN}.v -log_file ${run_dir}/${STAGE}/reports/rtl2final.lec.log  > ${run_dir}/${STAGE}/out/rtl2final.lec.do


puts "\033\]2;[file tail $env(PWD)] - [set STAGE "Finish"] [clock format [clock seconds] -format "%R   %d / %m / %C%y"]\a"

puts "============================"
puts "Synthesis Finished ........."
puts "============================"

gui_show

#quit
