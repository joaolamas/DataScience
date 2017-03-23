set <- read.csv("./DataCleaning/w3_1.csv")
library(data.table)
df <- data.table(ACR=set$ACR,AGS=set$AGS)
df[ , a:=ACR==3]
df[ , b:=AGS==6]
df[ , agricultureLogical:=a==TRUE & b==TRUE]
which(df$agricultureLogical==TRUE)


library(jpeg)
img <- jpeg::readJPEG(source="./DataCleaning/w3_2.jpg", native =TRUE)
quantile(img, probs=c(0.3,0.8))


set <- read.csv("./DataCleaning/w3_3_1.csv", skip = 4, nrows = 215)
set2 <- read.csv("./DataCleaning/w3_3_2.csv")
library(data.table)
df1 <- data.table(set)
df1 <- df1[X != ""]
setnames(df1, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))
df2 <- data.table(set2)
dt <- merge(df1, df2, all = TRUE, by = c("CountryCode"))
sum(!is.na(unique(dt$rankingGDP)))
dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, rankingGDP, gdp)][13]


dt[, mean(rankingGDP, na.rm=TRUE), by=Income.Group]
dt[, mean(rankingGDP, na.rm=TRUE), by=Income.Group]


st <- quantile(dt$rankingGDP,probs = seq(0, 1, 0.2), na.rm=TRUE)
dt$quantileGDP <- cut(dt$rankingGDP, breaks = st)
dt[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
