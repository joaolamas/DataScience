
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL, destfile = "./data.csv")
dateDownload <- date()

data <- read.csv("./data.csv")
strsplit(names(data), "wgtp")

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileURL, destfile = "./data.csv")
dateDownload <- date()

data <- read.csv("./data.csv")
names(data)
gdp <- as.numeric(gsub(",","",data$X.3[5:194]))
mean(gdp)
countryNames <- data$X.2[5:220]
grep("^United",countryNames)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileURL, destfile = "./data.csv")
dateDownload <- date()

data <- read.csv("./data.csv")

fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileURL2, destfile = "./data2.csv")
dateDownload <- date()

data2 <- read.csv("./data2.csv")

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
table(grepl("2012", sampleTimes))
table(wday(sampleTimes[grep("2012", sampleTimes)]))
