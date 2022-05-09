# input data
library(tidyverse)
library(haven)
library(peacesciencer)
source("metadata.R")

# contiguity data
data(cow_contdir)
data(cow_majors)
data("cow_alliance")

##### Dataset 1 #####
# Geddes 2014 categorization data
# case: country-year
# cowcode, year
gwf <- haven::read_dta("data/GWF_AllPoliticalRegimes.dta") %>%
  rename_all(~str_replace_all(., "wf", "")) %>% na_if("") %>% na_if("NA")

# reshape
gwf_sub <- gwf %>%
  select(cowcode, year, g_party, g_military, g_monarchy, g_personal, g_nonautocracy) %>%
  rename(ccode = cowcode) %>% rename_all(~str_replace(., "g_", "")) %>%
  mutate(type = case_when(
    is.na(nonautocracy) ~ "autoc",
    nonautocracy == "democracy" ~ "democ",
    TRUE ~ "other")) %>% select(-nonautocracy) %>% fastDummies::dummy_columns("type") %>% select(-type) %>%
  rename_all(~str_replace(., "type_", "")) %>%
  pivot_longer(cols = c(party, military, monarchy, personal, democ, other), names_to = "regimetype") %>%
  filter(value == 1) %>% select(-value)

##### Dataset 2 #####
# National Material Capacity from Correlates of War
# regarding cinc and primary energy consumption
# case: country-year
cinc <- haven::read_dta("data/cinc6.dta") %>% na_if(-9)

##### Dataset 3 #####
# Militarized Interstate Disputes v5 from Correlates of War
# One record per participant's participation per dispute
## missing data coded as -9
midb <- read_dta("data/MIDB 5.0.dta") %>% na_if(-9)


labelled_cols <- lapply(metadata$col, function(col) {
  index <- which(metadata$col == col)
  labels <- unlist(metadata$labels[index])
  label <- metadata$label[index]
  #return(list(index, labels, label))
  midb[col] %>% mutate(across(col, ~labelled(as.integer(.), labels, label)))
}) %>% reduce(bind_cols)

midb[metadata$col] <- labelled_cols


##### Dataset 4 #####
# case: (country-year)
# cyear, code 
pol <- readxl::read_excel("data/p5v2018.xls") %>% select(-country)

pol_labelled_cols <- lapply(pol_metadata$col, function(col) {
  index <- which(pol_metadata$col == col)
  labels <- unlist(pol_metadata$labels[index])
  label <- pol_metadata$label[index]
  #return(list(index, labels, label))
  pol[col] %>% mutate(across(col, ~labelled(as.integer(.), labels, label)))
}) %>% reduce(bind_cols)
pol[pol_metadata$col] <- pol_labelled_cols

gwf_sub <- gwf %>%
  select(cowcode, year, g_party, g_military, g_monarchy, g_personal, g_nonautocracy) %>%
  rename(ccode = cowcode) %>% rename_all(~str_replace(., "g_", "")) %>%
  mutate(type = case_when(
    is.na(nonautocracy) ~ "autoc",
    nonautocracy == "democracy" ~ "democ",
    TRUE ~ "other")) %>% select(-nonautocracy) %>% fastDummies::dummy_columns("type") %>% select(-type) %>%
  rename_all(~str_replace(., "type_", "")) %>%
  pivot_longer(cols = c(party, military, monarchy, personal, democ, other), names_to = "regimetype") %>%
  filter(value == 1) %>% select(-value)

save(pol, midb, cinc, gwf, gwf_sub, cow_contdir, cow_majors, cow_alliance, cow_states, file = "data/input/data_components.rdata")

