fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL, destfile = "./data.csv")
dateDownload <- date()

data <- read.csv("./data.csv")
val <- subset(data$VAL, data$VAL == 24)
length(val)


library(xlsx)


fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL2, destfile = "./data2.xlsx", mode='wb')
dateDownload2 <- date()

ncols <- 7:15
nrows <- 18:23

dat <- read.xlsx("./data2.xlsx", sheetIndex = 1, colIndex = ncols, rowIndex = nrows)
sum(dat$Zip*dat$Ext,na.rm=T)


library(XML)
fileURL3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileURL3, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
#rootNode[[1]]
#rootNode[[1]][[1]]
#xmlSApply(rootNode, xmlValue)
#xpathSApply(rootNode, "//name", xmlValue)
#xpathSApply(rootNode, "//price", xmlValue)




fileURL3 <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileURL3, useInternalNodes = TRUE)
scores<- xpathApply(doc, "//li[@class='score']", xmlValue)
teams<- xpathApply(doc, "//li[@class='team-name']", xmlValue)

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)
myjson <- toJSON(dat, pretty = TRUE)
cat(myjson)
dat2 <- fromJSON(myjson)
head(dat2)


library(data.table)
DF <- data.frame(x = rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DF, 3)
DT = data.table(x = rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(9))
head(DT, 3)
tables()
DT[2,]


fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(fileURL, destfile = "./data.csv")
dateDownload <- date()

data <- read.csv("./data.csv")
DT <- data.table(data)
