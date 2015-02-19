library(devtools)
library(dplyr)

# Download units
download.file("http://www.dcmetrometrics.com/download/units.csv", 
              "data-raw/units.csv")
units <- read.csv("data-raw/units.csv", stringsAsFactors=FALSE)

# Download unit statuses
download.file("http://www.dcmetrometrics.com/download/unit_statuses.csv", 
              "data-raw/unit_statuses.csv")
unit_statuses <- read.csv("data-raw/unit_statuses.csv", stringsAsFactors=FALSE)

# Download HotCars data
download.file("http://www.dcmetrometrics.com/download/hotcars.csv", 
              "data-raw/hotcars.csv")
hotcars <- read.csv("data-raw/hotcars.csv", stringsAsFactors=FALSE)

# needs help: 
# unit_statuses$symptom_description
# units$station_name
# 
# in unit_statuses: what is: time, end_time, metro_open_time, 

elevators <- units %>%
  filter(unit_type == "ELEVATOR")

escalators <- units %>%
  filter(unit_type == "ESCALATOR")
  
elevator_statuses <- unit_statuses %>%
  filter(grepl("ELEVATOR", unit_id))
  
escalator_statuses <- unit_statuses %>%
  filter(grepl("ESCALATOR", unit_id))

save(elevators, file = "data/elevators.rda")
save(escalators, file = "data/escalators.rda")
save(elevator_statuses, file = "data/elevator_statuses.rda")
save(escalator_statuses, file = "data/escalator_statuses.rda")
save(hotcars, file = "data/hotcars.rda")