## rankall function
## takes two arguments: an outcome name (outcome) and a hospital ranking (num)
## returns a 2-column data frame containing the hospital in each state that has the ranking specified in num.

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  my_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  ## Check that state and outcome are valid
  if (outcome == "heart attack") {
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
  }
  else if (outcome == "heart failure") {
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  }
  else if (outcome == "pneumonia") {
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  }
  else {
    stop('invalid outcome')
  }
  
  ## For each state, find the hospital of the given rank
  data_by_state <- split(my_data[, c("Hospital.Name", "State", column)], my_data$State)
  
  # New rankHospital function
  rank_hospital <- function(data, num) {
    ordered_data <- order(data[3], data$Hospital.Name, na.last=NA)
    len <- length(ordered_data)
    if (num == "best") {
      data$Hospital.Name[ordered_data[1]]
    } 
    else if (num == "worst") {
      data$Hospital.Name[ordered_data[len]]
    }
    else if (is.numeric(num)) {
      data$Hospital.Name[ordered_data[num]]
    }
    else {
      stop("invalid num")
    }
  }
  
  ## Return a data frame with the hospital names and the (abbreviated) state name
  final <- lapply(data_by_state, rank_hospital, num)
  data.frame(hospital = unlist(final), state = names(final), row.names = names(final))
  
}