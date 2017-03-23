myfunction <- function() {
  a<- rnorm(100)
  mean(a)
}

second <- function(x) {
  x + rnorm(length(x))
}