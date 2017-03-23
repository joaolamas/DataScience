## best function
## Take two arguments: the 2-character abbreviated name of a state and an
## outcome name. 
## The function reads the outcome-of-care-measures.csv le and returns a character vector
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
## in that state.

best <- function(state, outcome) {
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
  
  state_v <- my_data[my_data$State == state, c("Hospital.Name", column)]
  if (nrow(state_v) == 0) {
    stop("invalid state")	
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  state_v[,2] <- as.numeric(state_v[,2])
  #order the states (the bests first)
  ordered_state_v <- order(state_v[column], state_v$Hospital.Name)
  #return the first one
  as.character(state_v$Hospital.Name[ordered_state_v[1]])
}