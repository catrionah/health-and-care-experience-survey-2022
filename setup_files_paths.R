# Name of file: HACE 2022 setup_file_paths.R
# 
# Data release (if applicable)
# 
# Original author(s): Catriona Haddow
#   
# Written/run on: Posit Workbench - RStudio R 4.1.2
# 
# Description of content: Create weight1 - probability of non-selection
# 
# Approximate run time: <1 min
# 
# Approximate memory usage: 245mib

#Inputs:
#"output/weights/eligible_pats_by_gp.rds"
#"output/weights/sample_size_by_gp.rds"

#Outputs:
#"output/weights/weight1.rds"
getwd()
lookup_path   <- if_else(substr(getwd(),2,5) == "conf","/conf/bss/pat-exp-surveys/health-and-care/training/lookups/","someothernetwork/lookups/")
data_path     <- if_else(substr(getwd(),2,5) == "conf","/conf/bss/pat-exp-surveys/health-and-care/training/data/","someothernetwork/data/")
output_path   <- if_else(substr(getwd(),2,5) == "conf","/conf/bss/pat-exp-surveys/health-and-care/training/output/","someothernetwork/output/")





