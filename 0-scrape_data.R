library(qualtRics)
library(tidyverse)


# connect to qualtrics ----------------------------------------------------


# this code requires a qualtrics api key.
# the code author's api key is stored in an R scripted titled "qualtrics_api.R"
# This script is a single line:
#   api_key = "key-here"

source("qualtrics_api.R")
qualtrics_api_credentials(api_key = api_key, 
                          base_url = "oregon.qualtrics.com",
                          install = TRUE,
                          overwrite = TRUE)

readRenviron("~/.Renviron")



# load/save time 1 survey ------------------------------------------------------

data_t1 <- fetch_survey(surveyID = "SV_3pxiBBEcabzp6mi", verbose = FALSE)

# filter out pilot data
data_t1 = data_t1 %>% 
  filter(StartDate >= as.Date("2023-03-06"))

# filter out missing prolific ID -- prolific ids are 24 characters long
data_t1 = data_t1 %>% 
  filter(str_length(proid) == 24)

# save file
write.csv(data_t1, file = "data/data_t1.csv", row.names = F)
write_rds(data_t1, file = "data/data_t1.rds")

# load/save time 2 survey A------------------------------------------------------

data_2A <- fetch_survey(surveyID = "SV_ai5QormGkrCZlaK", verbose = FALSE)

# filter out pilot data
data_2A = data_2A %>% 
  filter(StartDate >= as.Date("2023-03-06"))

# filter out missing prolific ID
data_2A = data_2A %>% 
  filter(str_length(proid) == 24)

# save file
write.csv(data_2A, file = "data/data_2A.csv", row.names = F)
write_rds(data_2A, file = "data/data_2A.rds")


# load/save time 2 survey B------------------------------------------------------

data_2B <- fetch_survey(surveyID = "SV_8hIRRDrReE7bCT4", verbose = FALSE)

# filter out pilot data
data_2B = data_2B %>% 
  filter(StartDate >= as.Date("2023-03-06"))

# filter out missing prolific ID
data_2B = data_2B %>% 
  filter(str_length(proid) == 24)

# save file
write.csv(data_2B, file = "data/data_2B.csv", row.names = F)
write_rds(data_2B, file = "data/data_2B.rds")

# load/save time 2 survey C------------------------------------------------------

data_2C <- fetch_survey(surveyID = "SV_7PbyAnxofW1svoa", verbose = FALSE)

# filter out pilot data
data_2C = data_2C %>% 
  filter(StartDate >= as.Date("2023-03-06"))

# filter out missing prolific ID
data_2C = data_2C %>% 
  filter(str_length(proid) == 24)

# save file
write.csv(data_2C, file = "data/data_2C.csv", row.names = F)
write_rds(data_2C, file = "data/data_2C.rds")

# load/save time 2 survey A------------------------------------------------------

data_2D <- fetch_survey(surveyID = "SV_7NXihgC50ka4Yvk", verbose = FALSE)

# filter out pilot data
data_2D = data_2D %>% 
  filter(StartDate >= as.Date("2023-03-06"))

# filter out missing prolific ID
data_2D = data_2D %>% 
  filter(str_length(proid) == 24)

# save file
write.csv(data_2D, file = "data/data_2D.csv", row.names = F)
write_rds(data_2D, file = "data/data_2D.rds")
