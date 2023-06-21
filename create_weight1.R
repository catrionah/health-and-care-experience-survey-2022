# Name of file: HACE 2022 create_weight1.R
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

# load in libraries
source("code/packages.R")

#to do: 

#Based on 2019/20 SPSS syntax: 05 - Calculate weight 1####
# Match sample size to eligible size
# Eligible practices: 907; sampled: 907.
#read in files

eligible_pats_by_gp <- readRDS("data/eligible_pats_by_gp.rds")
sample_size_by_gp <- readRDS("data/sample_size_by_gp.rds")

weight1 <- full_join(eligible_pats_by_gp,sample_size_by_gp,by = c("gp_prac_no"))
#Divide the eligible patients by the sampled patients in each GP Practice to calculate the Weight 1 value.
weight1 <- weight1 %>%
  mutate(gp_wt1 = eligible_pats/sample_pop)

nrow(weight1)

mean(weight1$gp_wt1)

range(weight1$gp_wt1)

sd(weight1$gp_wt1)


#maximum and mean rather higher than last time
weight1_sum <- weight1%>%
  group_by('level'= "level") %>%
  summarise(gp_wt1 = sum(gp_wt1))

#check if the same as before
hist.file <- readRDS("data/weight1.rds")
identical(hist.file,weight1)
file.remove ("data/weight1.rds")

saveRDS(weight1,"data/weight1.rds")




