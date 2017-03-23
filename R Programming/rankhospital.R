## rankhostital function
## Takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome),
## and the ranking of a hospital in that state for that outcome (num)
## returns a character vector with the name
## of the hospital that has the ranking specified by the num argument

rankhospital <- function(state, outcome, num = "best") {
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
  
  ## Return hospital name in that state with the given rank 30-day death rate
  state_v[,2] <- as.numeric(state_v[,2])
  # Order the data
  ordered_state_v <- order(state_v[column], state_v$Hospital.Name, na.last=NA)
  # Check length to retrieve the last one
  len <- length(ordered_state_v)
  
  # If best, give the first
  if (num == "best") {
    as.character( state_v$Hospital.Name[ordered_state_v[1]])
  }
  # If worst give the last
  else if (num == "worst") {
    as.character( state_v$Hospital.Name[ordered_state_v[len]])
  }
  # If num give num
  else if (is.numeric(num)) {
    as.character( state_v$Hospital.Name[ordered_state_v[num]])
  }
  # If invalid
  else {
    stop("invalid num")
  }
  
}