pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  cnames <- c("Date", "sulfate", "nitrate", "ID")
  my_data <- matrix(ncol = 1)
  
  for (i in id) {
    
    if (nchar(i)==1) { name <- paste('00', toString(i), sep = "") }
    else if (nchar(i)==2) { name <- paste('0', toString(i), sep = "") }
    else if (nchar(i)==3) { name <- toString(i) }
    
    filename <- paste(directory, '/', name, '.csv', sep = "")
    set <- read.csv(filename)
    
    my_data <- rbind(my_data[pollutant], set[pollutant])
  }
  
  filtered_data <- my_data[complete.cases(my_data[pollutant]), ]
  mean(filtered_data)
}


complete <- function(directory, id = 1:332) {
  cnames <- c("id", "Noobs")
  my_data <- data.frame()
  
  for (i in id) {
    
    if (nchar(i)==1) { name <- paste('00', toString(i), sep = "") }
    else if (nchar(i)==2) { name <- paste('0', toString(i), sep = "") }
    else if (nchar(i)==3) { name <- toString(i) }
    
    filename <- paste(directory, '/', name, '.csv', sep = "")
    set <- read.csv(filename)
    
    cc <- set[complete.cases(set), ]
    len <- dim(cc)[1]
    newrow = c(mean(cc$ID), len )
    my_data = rbind(my_data, newrow)
    
  }
  
  names(my_data)[1] <- ("Id")
  names(my_data)[2] <- ("Noobs")
  my_data
}

corr <- function(directory, threshold = 0) {
  
  each_cor <- function(fname) {
    #read file
    data <- read.csv(file.path(directory, fname))
    #only completes
    nobs <- sum(complete.cases(data))
    #apply threshold:
    if (nobs > threshold) {
      return (cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
  }
  
  total_correlations <- sapply(list.files(directory), each_cor) 
  
  total_correlations <- unlist(total_correlations[!sapply(total_correlations, is.null)]) 
  
  total_correlations

}