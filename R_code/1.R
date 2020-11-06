a <- 4
b <- 5
c= a+b
print(c)
c

a = 3.14 #pi
a
print(a)

a <- "hello"
x = "seoul"
y = '수도'

TRUE&TRUE
TRUE&FALSE
TRUE|FALSE
!TRUE
!(FALSE|TRUE)

gender <- factor("f", c("m","f"))
gender

levels(gender)[1]
levels(gender)[2]

gender
levels(gender) <- c("male", "female")
gender

ordered(c("a","b","c","d"))
factor(c("a","b","c","d"), ordered=TRUE)

x <- c(1,2,3,4,5,6,7,8,9)
x

x <- c("1","2","3","4","5")
x

x <- 1:5
x

seq(1,5,2)

seq_along(c("a","b","c","d"))
seq_len(4)

x <- c(1,3,5,7)
names(x) <- c("noh", "kim", "park", "baek")
x

x[2]

x[c(1,3)]
x[1:3]

length(x)
NROW(4)

seq(1:100)

1:11
seq(1,11,3)

rep(1:3, each = 3)

sequence(c(2,5,3))

x=1:7; x

x <7
x >3
x >1 & x<7
x>1 && x<7
x>1||x<7
x>1|x<7
x==5
x!=5
!x==5

mode(pi); typeof(pi); storage.mode(pi)
a=3.14159; mode(a)
mode(5>8)
국가="대한민국"; mode(국가)
mode(T); mode(TRUE); mode(FALSE)
mode(1+5i)

one<-100
two<-90
three<-80
four<-70
five<-NA
is.na(five)

x<-NULL
is.null(x)
is.null(y)
is.na(NULL)

3+TRUE
(3+4i)+4
c("34", "4")
T+T
T*F
5i
typeof(x)


matrix (1:20, ncol=5)
array(1:20, dim=c(4,5))

a <- c(1,2,3,4,5)
a
a <- 1:9
dim(a) <- c(3,3)
a
typeof(a)

iq.score <- list(c(110, 130, 145, 160))
mean(iq.score)
mean(unlist(iq.score))
summary(iq.score)


na1 <- data.frame(x=c("seoul","rome","vienna", "bern"), y=c(1,2,3,4))
na1
vec <- c("100","95","90","85")
na1$ncol <- vec
na1
names(na1) <- c("city","rank","values")
na1

a1 <- 1:5
a2 <- 6:10
a1
a2
my1<- list(data1=a1, data2=a2)
my1
data.frame(my1)
mydata<- data.frame(my1)
rownames(mydata)
colnames(mydata)
rownames(mydata) <- c("one","two","three","four","five")
mydata

summary(iris)
summary(as.list(iris))
lapply(as.list(iris), summary)

View(iris)
summary(iris3)
summary(AirPassengers)
View(iris3)

iris$Species2 <- as.factor(sample(1:5, 150, replace = TRUE))
str(iris)
summary(table(iris$Species, iris$Species2))

scale(iris$Sepal.Length)
(3.8 - mean(iris$Sepal.Length))/sd(iris$Sepal.Length)
plot(iris)
plot(iris3)
x <- rnorm(40,mean = 95, sd = 10)

t.test(x, mu = 90)
t.test(x)
t.test(x, conf.level=0.99)

prop.test(56,100,0.5)

prop.test(56,100,0.5, alternative = "greater")
attach(iris)
shapiro.test(Sepal.Length)

cor.test(iris$Sepal.Length, iris$Sepal.Width)


a<- c(100,98,85,90,88,80)
b<- c(73,80,80,75,67,57)
c <-c(110,104,91,109,85,95)
life <- data.frame(a,b,c)
b.life =stack(life)
b.life

op = par(mfrow = c(1,2))
boxplot(values ~ ind, data = b.life)

install.packages("zoo")
library(zoo)

stripchart(life)

par(op)
dev.off()
oneway.test(values ~ ind, data = b.life, var.equal = TRUE)

type = c(rep('a',6), rep('b',6), rep('c',6))
y = c(100,98,85,90,88,80,73,80,80,75,67,57,110,104,91,109,85,95)
ty = as.factor(type)
life.aov = aov(y ~ty)
summary(life.aov)

life.tukey = TukeyHSD(life.aov, "ty", ordered = TRUE)
life.tukey
plot(life.tukey)
pairwise.t.test(y,ty,p.adjust = 'none', pool.sd = TRUE)

pressure = as.factor(c(320,340,360,310,330,350,300,320,340,310,330,350))
temp= as.factor(c(rep('low',6), rep('high',6)))
y = c(130.5, 120.2, 150.8,
+ 170.2, 157.1, 164.7,
+ 102.6, 181.6, 160.5,
+189.5, 165.3, 176.5)
op = par(mfrow = c(2,2))
plot(y ~ temp)
plot(y ~ pressure)
stripchart(y ~temp, vertical = TRUE, xlab = "temperature")
stripchart(y ~pressure, vertical = TRUE, xlab = "pressure")
par(op)
op = par(mfrow = c(1,2))
interaction.plot(temp, pressure, y ,bty = 'l', main = 'interaction plot')
interaction.plot(pressure, temp, y ,bty = 'o')
par(op)
aov_pt = aov(y ~ temp + pressure + temp:pressure)
aov_pt

summary(aov_pt)

apts <- ts(AirPassengers, frequency = 12)
plot(apts)
acf(apts)
pacf(apts)
spectrum(apts)
acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))

m <- lm(coredata(apts) ~ index(apts))
apts.eltr <- ts(resid(m), index(apts))
plot(apts.eltr)
plot(diff(log(apts)))
f <- decompose(apts)
attributes(f)
plot(f$figure, type = "b", xaxt = "n", xlab = "")
monthNames <- months(ISOdate(2012,1:12,1))
axis(1, at=1:12, labels = monthNames, las = 2)
plot(f)

install.packages("forecast")

library(forecast)
apts.arima <- auto.arima(apts)
summary(apts.arima)

fore <- predict(apts.arima, n.ahead = 24)
U <- fore$pred + 2*fore$se
L <- fore$pred + 2*fore$se
apts.smoothing <- HoltWinters(apts, seasonal = "mul")
fore2 <- predict(apts.smoothing, n.ahead = 24)
ts.plot(apts, fore$pred, U, L, fore2, col = c(1,2,4,4,6), lty = c(1,1,2,2,3))
legend("topleft", c("Actual", "ARIMA", "ARIMA Error Bounds (95% Confidence)", "exponential smoothing"),, col = c(1,2,4,6), lty = c(1,1,2,3))

apts.log <- log(apts)
apts.log.arima <- auto.arima(apts.log)
summary(apts.log.arima)

fore <- predict(apts.log.arima, n.ahead = 24)
U <- fore$pred + 2*fore$se
L <- fore$pred + 2*fore$se
apts.smoothing <- HoltWinters(apts.log, seasonal = "mul")
fore2 <- predict(apts.smoothing, n.ahead = 24)
ts.plot(exp(apts.log), exp(fore$pred), exp(U), exp(L), exp(fore2), col = c(1,2,4,4,6), lty = c(1,1,2,2,3))
legend("topleft", c("Actual", "ARIMA", "ARIMA Error Bounds (95% Confidence)", "exponential smoothing"),, col = c(1,2,4,6), lty = c(1,1,2,3))

rm(list = ls(all=TRUE))
data <- iris
head(data)
data$Species <- NULL
head(data)
(m <-kmeans(data,4))
table(iris$Species, m$cluster)
table(iris$Species, m$cluster)
plot(data[c("Sepal.Length", "Sepal.Width")], main = "kmeans", col=m$cluster)
plot(iris$Sepal.Length, iris$Sepal.Width, main = "true", col = c(1,2,3)[unclass(iris$Species)])
(m <- kmeans(data,4))
table(iris$Species, m$cluster)
plot(data[c("Sepal.Length", "Sepal.Width")], col = m$cluster)

x <-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y <-c(1,2,3,4,5,6,7,8,9,10,11,12,13)

par(mfrow = c(1,1))
plot(x,y,main = "PLOT", sub="Test", xlab="x-label",ylab="y-label",type="n")

x <-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y <-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
z <-c(2.5, 1.5, 2.3, 6.6, 4.7)
plot(x,y,main = "PLOT", sub="Test", xlab="x-label",ylab="y-label",type="n")
points(z, pch=5, cex=1)

plot(x,y,main = "PLOT", sub="Test", xlab="x-label",ylab="y-label",type="p")
text(9,10,"plotting", col = "red")
abline(h=6, v=9, lty=3)


x<-rnorm(1000,mean=5, sd=1)
hist(x)
hist(x, freq=F, col = "violet")
curve(dnorm(x, mean = 5, sd = 1), add=T, col = "red")
install.packages("ggplot2")

library(ggplot2)
test.data <- data.frame(length=c(3,2,5,8), width=c(4,3,6,9), depth=c(5,2,16,80), trt=c("a","a","b","b"))
ggplot(test.data, aes(x=length, y=width))+geom_point(aes(colour=trt))

ggplot(test.data, aes(x=length, y=width))+geom_point(aes(colour=trt))+geom_smooth()

ggplot(data = diamonds, aes(x=carat, y=price)) + geom_point(aes(colour=clarity))
ggplot(data = diamonds, aes(x=carat, y=price, colour = clarity)) + geom_point() + geom_smooth()

View(diamonds)

install.packages("tm")
library(tm)
getwd()

txt <- system.file("texts", package = "tm")
txt
getReaders()
korea <- Corpus(DirSource(txt, encoding = "UTF-8"), readerControl = list(language = "en"))
korea
korea[[1]]
korea <- VCorpus(VectorSource(korea))
korea <- tm_map(korea, stripWhitespace)
korea[[1]]
korea<- tm_map(korea,tolower)
korea[[1]]
korea<- tm_map(korea, removeWords, stopwords("english"))
korea[[1]]
korea<- tm_map(korea, removePunctuation)
korea[[1]]
korea<- tm_map(korea, removeNumbers)
korea[[1]]
install.packages("SnowballC")
library(SnowballC)
korea<- tm_map(korea, stemDocument)
korea[[1]]
korea<- tm_map(korea,PlainTextDocument)
korea[[1]]
kdtm<- DocumentTermMatrix(korea)
kdtm
kdtm<- TermDocumentMatrix(korea)
kdtm
findFreqTerms(kdtm, 10)

mykdtm<- TermDocumentMatrix(korea, control = list(wordLength = c(1, Inf)))
install.packages("wordcloud")
library(wordcloud)

w <- as.matrix(mykdtm)
wordFreq <- sort(rowSums(w), decreasing = TRUE)
grayLevels <- gray((wordFreq+10)/(max(wordFreq)+10))
wordcloud(words = names(wordFreq), freq=wordFreq, min.freq=3, random.order = F,random.color = T)

getwd()

install.packages("devtools")
devtools::install_github('haven-jeon/KoNLP')

install.packages("backports")

library(KoNLP)
library(wordcloud)
useSejongDic()

x <-rnorm(1000, mean = 5, sd = 1)
hist(x, freq = F)
curve(dnorm(x, mean = 5, sd = 1), add = T)

install.packages("googleVis")
library(googleVis)

wt1 <- gvisWordTree(Cats, textvar = "Phrase")
plot(wt1)

#카이제곱
============================================
setwd("C:/rtest")
mycar <- read.csv("mycar.csv", header = TRUE)

install.packages("Hmisc")
library(Hmisc)
install.packages("prettyR")
library(prettyR)

table(mycar$color)
table(mycar[2])

prop.table(table(mycar$color))
prop.table(table(mycar[2]))
prop.table(table(mycar$color))*100
round(prop.table(table(mycar[2]))*100, 1)

surveyFreq <- c(table(mycar$color))
surveyProp <- c(round(prop.table(table(mycar[2]))*100, 1))
surveytable <- data.frame(Freq=surveyFreq, Prop=surveyProp)
surveytable

describe(mycar)
describe(mycar$color)

chisq.test(surveyFreq)

setwd("C:/rtest")
mytooth <- read.csv("mytooth.csv", header = TRUE)
library(Hmisc)
library(prettyR)

table(mytooth$buy)
table(mytooth[2])

prop.table(table(mytooth$buy))
prop.table(table(mytooth[2]))
prop.table(table(mytooth[2]))*100
round(prop.table(table(mytooth[2]))*100, 1)

buyFreq <- c(table(mytooth$buy))
buyProp <- c(round(prop.table(table(mytooth[2]))*100, 1))
buytable <- data.frame(Freq=buyFreq, Prop=buyProp)
buytable
print(buytable)

describe(mytooth)
describe(mytooth$buy)

freq(mytooth)
freq(mytooth$buy)

binom.test(c(40,10), p= 0.10)
binom.test(c(40,10), p= 0.10, alternative = "two.sided", conf.level = 0.95)
binom.test(c(40,10), p= 0.15, alternative = "greater", conf.level = 0.95)

getwd()
setwd("C:/rtest")
myheight <- read.csv("myheight.csv", header = TRUE)
library(Hmisc)
library(prettyR)

myheight$height
mean(myheight$height)
range(myheight$height)

myheight5 <- subset(myheight, height != 999, c(height))
myheight5

mean(myheight5$height)
range(myheight5$height)

describe(myheight5)
describe(myheight5$height)

shapiro.test(myheight5$height)

wilcox.test(myheight5$height, mu = 145.0)

wilcox.test(myheight5$height, mu = 145.0, alter = "greater", conf.level =  0.95)

getwd()
setwd("C:/rtest")
mycf <- read.csv("mycf.csv", header = TRUE)
library(Hmisc)
library(prettyR)

mycf
mycf$group
mycf$interest
mycf[c("group", "interest")]

table(mycf$group)
table(mycf$interest)
table(mycf$group, mycf$interest)

prop.table(table(mycf$group, mycf$interest))
round(prop.table(table(mycf$group, mycf$interest))*100, 1)
prop.test(c(13,27), c(50,50))
prop.test(c(13,27), c(50,50), alter = "less", conf.level = 0.95)

getwd()
setwd("C:/rtest")
mymethod <- read.csv("mymethod.csv", header = TRUE)

mymethod$method
mymethod$performance

groupA <- subset(mymethod, method == 1& performance <99)
groupB <- subset(mymethod, method == 2& performance <99)
groupAcount <- length(groupA$method)
groupAmean <- round(mean(groupA$performance),2)
groupAcount;groupAmean
groupBcount <- length(groupB$method)
groupBmean <- round(mean(groupB$performance),2)
groupBcount;groupBmean

groupcount <- c(groupAcount, groupBcount)
groupmean <- c(groupAmean, groupBmean)
groupcount;groupmean
grouptable <- data.frame(Freq=groupcount, Mean=groupmean)
grouptable

var.test(groupA$performance, groupB$performance)

t.test(groupA$performance, groupB$performance, alter = "two.sided", conf.int = TRUE, conf.level = 0.95)
t.test(groupA$performance, groupB$performance, alter = "greater", conf.int = TRUE, conf.level = 0.95)
t.test(groupA$performance, groupB$performance, alter = "less", conf.int = TRUE, conf.level = 0.95)

getwd()
setwd("C:/rtest")
myeffect <- read.csv("myeffect.csv", header = TRUE)
myeffect

myeffect$before
myeffect$after

myeffect2 <- subset(myeffect, after < 999)
myeffect3 <- subset(myeffect, after != 999)
myeffect4 <- subset(myeffect, after < 999, c(before, after))
myeffect5 <- subset(myeffect, after != 999, c(before, after))
myeffect5
groupBE <- c(myeffect$before)
groupAF <- c(myeffect$after)

length(myeffect5$before)
length(myeffect5$after)
mean(myeffect5$before)
mean(myeffect5$after)

var.test(myeffect5$before, myeffect$after, paired = TRUE)

wilcox.test(groupBE, groupAF, paired = TRUE)
wilcox.test(groupBE, groupAF, paired = TRUE, alter = "two.sided", conf.int = TRUE, conf.level = 0.95)

install.packages("readxl")
install.packages("plyr")

getwd()
setwd("C:/rtest")
library(readxl)
library(plyr)
mysmoke <- read_xlsx("mystudy.xlsx", sheet = "mysmoke")
mysmoke
table(mysmoke$education, mysmoke$smoking)

mysmoke$education2[mysmoke$education==1] <- "university"
mysmoke$education2[mysmoke$education==2] <- "highschool"
mysmoke$education2[mysmoke$education==3] <- "elementary"
mysmoke$smoking2[mysmoke$smoking==1] <- "many"
mysmoke$smoking2[mysmoke$smoking==2] <- "middle"
mysmoke$smoking2[mysmoke$smoking==3] <- "none"
mysmoke

mysmoke$education3 <- mapvalues(mysmoke$education,
                                from = c(1,2,3), to = c("university", "highschool", "elementary"))
mysmoke$smoking3 <- mapvalues(mysmoke$smoking,
                                from = c(1,2,3), to = c("many", "middle", "none"))
mysmoke

table(mysmoke$education2, mysmoke$smoking2)
chisq.test(mysmoke$education2, mysmoke$smoking2)


getwd()
setwd("C:/rtest")
library(readxl)
library(XLConnect)
mystudy <- loadWorkbook("mystudy.xlsx", create = TRUE)
mydrink0 <- readWorksheet(mystudy, sheet = "mydrink", startRow = 1, startCol = 1, endRow = 11, endCol = 3)
mydrink0

a1 <- mydrink0$d1
a2 <- mydrink0$d2
a3 <- mydrink0$d3
z1 <- mean(a1)
z2 <- mean(a2)
z3 <- mean(a3)
z1; z2; z3

mydrink <- readWorksheet(mystudy, sheet = "mydrink", startRow = 14, startCol = 1, endCol = 4)
mydrink
mydrink2 <- mydrink[,-1]
mydrink2

fitdrink <- cmdscale(mydrink2, eig = TRUE, k =2)
fitdrink
x <- fitdrink$points[,1]
y <- fitdrink$points[,2]

plot(x,y, pch=19, xlim = c(-4,4), ylim = c(-2,2))
mydrinknames = c("콜라", "포카리", "게토레이")
text(x,y, pos = 3, labels = mydrinknames)
abline(h = 0, v = 0)

setwd("C:/bigr")
getwd()
practice <- read.csv("practice.csv", header = TRUE)

install.packages("psych")
library(psych)
describe(practice)

setwd("C:/bigr")
smoke <- read.csv("smoke.csv", header = TRUE)

table(smoke$success)
prop.table(table(smoke$success))
prop.table(table(smoke$success))*100
round(prop.table(table(smoke$success))*100, 1)

smokeFreq <- c(table(smoke$success))
smokeProp <- c(round(prop.table(table(smoke$success))*100, 1))
smoketable <- data.frame(Freq = smokeFreq, Prop = smokeProp)
smoketable

describe(smoke$success)
freq(smoke$success)

binom.test(c(16,44), p=0.10)
binom.test(c(16,44), p=0.15, alternative = "greater", conf.level = 0.95)

factory <- read.csv("factory.csv", header = TRUE)

View(factory)

table(factory$공정, factory$불량률)
prop.table(table(factory$공정, factory$불량률))*100

prop.test(c(33,13), c(50,50))
prop.test(c(33,13), c(50,50), alternative = "greater", conf.level = 0.95)

cf <- read.csv("cf.csv", header = TRUE)
View(cf)

table(cf$group, cf$interest)
prop.table(table(cf$group, cf$interest))*100
prop.test(c(37,23), c(50,50))
prop.test(c(37,23), c(50,50), alternative = "less", conf.level = 0.95)
prop.test(c(37,23), c(50,50), alternative = "greater", conf.level = 0.95)

business <- smoke <- read.csv("business.csv", header = TRUE)

str(business)
View(business)
describe(business)
range(business)
colnames(business) <- c("gender", "score")

t.test(business$score, mu = 3.2)
t.test(business$score, mu = 3.2, alter = "two.sided", conf.level = 0.95)
t.test(business$score, mu = 3.2, alter = "greater", conf.level = 0.95)
t.test(business$score, mu = 3.2, alter = "less", conf.level = 0.95)

coffee <- read.csv("coffee.csv", header = TRUE)
str(coffee)
View(coffee)

cor(coffee)
plot(coffee)
coffee.cor <- cor(coffee)
coffee.cor

corrplot(coffee.cor, method = "color")

coffee$재방문의도 <- c(coffee$재방문의도1 + coffee$재방문의도2)
coffee$내부환경만족도 <- c(coffee$내부환경만족도1 + coffee$내부환경만족2 +coffee$내부환경만족3)
coffee$커피품질만족도 <- c(coffee$커피품질만족도1 + coffee$커피품질만족도2 +coffee$커피품질만족도3)

coffee2 <- data.frame(coffee$재방문의도, coffee$내부환경만족도, coffee$커피품질만족도)
View(coffee2)

cor(coffee2)
coffee.cor <- cor(coffee2)
coffee.cor

corrplot(coffee.cor, method = "color")
corrplot(coffee.cor, method = "shade", addshade = "all", shade.col = FALSE,
         tl.col = "red", tl.srt = 30, diag = FALSE, addCoef.col = "white", order= "FPC")

library(cluster)
result <- read.csv("myRFM.csv", header = TRUE)
View(result)

result2 <- hclust(dist(result), method = "ave")
names(result2)
result2
result2$order
plot(result2, hang = -1, labels = result2$ID)
View(result2)


library(party)
result <- read.csv("myhuman.csv", header = TRUE)
View(result)


set.seed(1234)
resultsplit <- sample(2, nrow(result), replace = TRUE, prob = c(0.7, 0.3))

trainD <- result[resultsplit ==1,]
testD <- result[resultsplit ==2,]
rawD <- Group ~ Sociability + Rating + Career + Score
trainModel <- ctree(rawD, data = trainD)

table(predict(trainModel), trainD$Group)
View(testD)

library(KoNLP)
library(arules)
library(igraph)
library(combinat)

rule <- file("trump.txt", encoding = "UTF-8")
rules <- readLines(rule)
close(rule)
head(rules, 10)

tran <- Map(extractNoun, rules)
tran <- unique(tran)
tran <- sapply(tran, unique)
tran <- sapply(tran, function(x) {Filter(function(y)
  {nchar(y) <= 4&& nchar(y) > 1 && is.hangul(y)}, x)})
tran <- Filter(function(x) {length(x) >= 2}, tran)
tran

names(tran) <- paste("Tr", 1:length(tran), sep="")
names(tran)
wordtran <- as(tran, "transactions")
wordtran

wordtab <- crossTable(wordtran)
wordtab

ares <- apriori(wordtran, parameter = list(supp=0.1, conf=0.2))

inspect(ares)
rules <- labels(ares, ruleSep="")
rules <- sapply(rules, strsplit, " ", USE.NAMES = F)
rulemat <- do.call("rbind", rules)

ruleg <- graph.edgelist(rulemat[-c(1:2),], directed=F)

#8.13~

install.packages("installr")
library(installr)
updateR()
update.packages(checkBuilt = TRUE)
version
packageStatus()
w <- c(1,2,3)
e <- c(4,5,6)

z = rbind(w,e)
z
zz <- cbind(w,e)
zz
z[1,]
z[2,]
z[2,3]
z[-1,]
zlist <- z[2,3]
zlist
a <- c(10,11,2)
a <- c(10,11,12)
z
b <- c(13,14,15)
ab <- rbind(a,b)
ab

x <- matrix(1:20, nrow = 4)
x
z
row <- apply(x, 1, mean)
row
col <- apply(x, 2, mean)
col

head(iris)
summary(iris)
order(iris$Sepal.Length)
tem <- iris[order(iris$Sepal.Width),]
head(tem)
range(x)
sample(1:10, 5, replace = TRUE)
split(iris, iris$Species)
tem2 <- subset(iris, Species =="setosa")
head(tem2)
tem3 <- subset(iris, Species == "setosa" & Sepal.Length > 5.0)
head(tem3)
sample(1:10, 5, replace = TRUE)

tem4 <- subset(iris, sselect = c(Sepal.Width, Species))
str(tem4)
head(tem4)

score <- data.frame(name=c("Seoul","Busan","Daegu","KwangJu"), population=c(1500, 200, 150, 70))
score

score2 <- data.frame(name=c("Seoul","Busan","Daegu","KwangJu"), HighTemp=c(35, 40, 32, 29))
score2
merge(score, score2)

with ( iris,
       {
         print("Max of Sepal.Width\n")
         print(max(Sepal.Width))
         print("Min of Sepal.Width\n")
         print(min(Sepal.Width))
       })
        
which.min(iris$Sepal.Length)
which.max(iris$Sepal.Length)

aggregate(Sepal.Width~Species, iris, mean)
aggregate(Sepal.Width~Species, iris, max)

a <- 1:12
for(i in a){
  print(i*2)
}

tracemem(a)
a <- 5
while(a<12){
  a = a+1
  print(a)
}

sales <- read.csv("sales.csv", header = TRUE)
str(sales)
View(sales)

sales.lm <- lm(sales ~ rd, data = sales)
summary(sales.lm)
plot(sales ~ rd, data = sales)
abline(sales.lm)

coffee <- read.csv("coffee.csv", header = TRUE)
str(coffee)
View(coffee)

shapiro.test(coffee$선택요인)
chisq.test(coffee$선택요인)

table(coffee$선택요인)
prop.table(table(coffee$선택요인))
round(prop.table(table(coffee$선택요인))*100,1)

coffeeFreq <- c(table(coffee$선택요인))
coffeeProp <- c(round(prop.table(table(coffee$선택요인))*100,1))
coffeetable <- data.frame(Freq=coffeeFreq, Prop=coffeeProp)
coffeetable
describe(coffeetable)
library(Hmisc)
library(prettyR)
library(dplyr)

coffeetable
describe(coffee)
freq(coffee)

chisq.test(coffeeFreq)
chisq.test(coffeeProp)

toeic <- read.csv("abroad.csv", header = TRUE)
table(toeic$성별, toeic$토익점수)
names(toeic$성별) <- c("gender")
View(toeic)

names(toeic)[names(toeic) =="성별"] <- c("gender")
names(toeic)[names(toeic) =="토익점수"] <- c("score")
toeic$gender2[toeic$gender == 1] <- "남자"
toeic$gender2[toeic$gender == 2] <- "여자"
toeic$score2[toeic$score <= 990] <- "상"
toeic$score2[toeic$score <= 750] <- "중"
toeic$score2[toeic$score <= 500] <- "하"

a <- table(toeic$gender2, toeic$score2)
chisq.test(a)
chisq.test(toeic$gender2, toeic$score2)
library(gmodels)
CrossTable(a, expected = TRUE, format="SPSS")

names(toeic)[names(toeic)=="해외경험"] <- "exp"

toeic$exp2[toeic$exp == 1] <- "있다"
toeic$exp2[toeic$exp == 2] <- "없다"

table(toeic$exp2, toeic$score2)
chisq.test(toeic$exp2, toeic$score2)
CrossTable(toeic$exp2, toeic$score2)
chisq.test(toeic$exp, toeic$score)

museum <- read.csv("museum.csv", header = TRUE)
View(museum)

chisq.test(museum$group, museum$visit)

library(xlsx)
mysmoke <- read_xlsx("mystudy.xlsx", sheet = "mysmoke")
View(mysmoke)

chisq.test(mysmoke$education, mysmoke$smoking)

service <- read.csv("service.csv", header = TRUE)
View(service)
table(service)
service_Freq <- table(service)
chisq.test(service_Freq)

factory <- read.csv("factory.csv", header = TRUE)
View(factory)
colnames(factory) <- c("fair", "unfair")

table(factory$fair)
table(factory$unfair)
library(psych)
factory$fair2[factory$fair == 1] <- "기존"
factory$fair2[factory$fair == 2] <- "신규"

factory$unfair2[factory$unfair == 0] <- "변화없음"
factory$unfair2[factory$unfair == 1] <- "변화있음"

table(factory$fair2, factory$unfair2)
prop.table(table(factory$fair2, factory$unfair2))*100

factory_prop <- prop.table(table(factory$fair2, factory$unfair2))*100
factory_prop

prop.test(c(66,26), c(100,100), alter = "greater", conf.level = 0.95)

cf <- read.csv("cf.csv", header = TRUE)
View(cf)

cf$group2[cf$group==1] <- "cele"
cf$group2[cf$group==2] <- "normal"
cf$interest2[cf$interest==1] <- "ok"
cf$interest2[cf$interest==0] <- "no"
View(cf)

table(cf$group2, cf$interest2)
prop.table(table(cf$group2, cf$interest2))*100

prop.test(c(37,23), c(50,50))
prop.test(c(37,23), c(50,50), alter = "greater", conf.level = 0.95)

ki <- read.csv("myheight.csv", header = TRUE)
View(ki)
str(ki)
describe(ki)

shapiro.test(ki$height)

ki2 <- subset(ki, height != 999, c(height))
View(ki2)
mean(ki2$height)

t.test(ki2$height, mu = 145.0, alter = "greater", conf.level = TRUE)

result <- read.csv("mytelecom.csv", header = TRUE)
View(result)

result2 <- lm(churn ~ tenure + income + age + gender, data = result)
result2
summary(result2)

#8.14
mymethod <- read.csv("mymethod.csv", header = TRUE)
View(mymethod)
mymethod$method
mymethod$performance
groupA <- subset(mymethod, method == 1 & performance <99)
groupB <- subset(mymethod, method == 2 & performance <99)
View(groupA)
View(groupB)

jobedu <- read.csv("jobedu.csv", header = TRUE)
View(jobedu)
tapply(jobedu$performance, jobedu$method, shapiro.test)

is.na(jobedu)
table(is.na(jobedu$performance))

jobedu$performance <- ifelse(jobedu$performance ==99, NA, jobedu$performance)
is.na(jobedu)
table(is.na(jobedu$performance))

jobedu2 <- jobedu %>% filter(!is.na(performance))
tapply(jobedu2$performance, jobedu2$method, shapiro.test)
tapply(jobedu2$performance, jobedu2$method, nortest::ad.test)
shapiro.test(jobedu2$performance, jobedu2$method)


bartlett.test(jobedu2$performance, jobedu2$method, data=jobedu2)
#jobedu7 <- oneway.test(performance~method, data = jobedu2, var.equal = F)
#jobedu7
jobedu.lm <- lm(performance ~ method, data = jobedu2)
anova(jobedu.lm)

library(agricolae)
model <- aov(performance~method, jobedu2)
comparison <- LSD.test(model, "method", p.adj = "bonferroni", group = T)
comparison

View(jobedu2)
method1 <- subset(jobedu2, method==1)
method2 <- subset(jobedu2, method==2)
method3 <- subset(jobedu2, method==3)

var.test(method1$performance, method2$performance)
var.test(method1$performance, method3$performance)

t.test(method1$performance, method2$performance, alter = "two.sided", confint = TRUE, conf.level = 0.95)
t.test(method1$performance, method3$performance)

a <- read.csv("cosmetics.csv", header = TRUE)
View(a)
attach(a)
describeBy(satisf_al, group = decision)
ano <- aov(satisf_al ~ factor(decision))
summary(ano)
TukeyHSD(ano)
library(agricolae)
scheffe.test(ano, "factor(decision", alpha=0.05, console = T)
duncan.test(ano, "factor(decision", alpha=0.05, console = T)
LSD.test(ano, "factor(decision", alpha=0.05, console = T)
detach(a)

sales <- read.csv("sales.csv", header = TRUE)
str(sales)
sales.lm <- lm(sales ~ rd, data= sales)
summary(sales.lm)

sales.lm2 <- lm(profit ~ rd + ad +promotion, data = sales)
summary(sales.lm2)

install.packages("car")
library(car)
vif(sales.lm2)
sales.lm3 <- lm(profit ~ promotion + ad, data = sales)
vif(sales.lm3)

summary(sales.lm3)

library(pequod)
View(a)
model1 <- lm(repurchase ~ satisf_i, data = a, x=TRUE, y=TRUE)
anova(model1)
summary(model1)
ggplot(a, aes(x=satisf_i, y=satisf_al))+ geom_smooth(method=lm, color="red") + geom_point()

ncvTest(model1)
install.packages("lmtest")
library(lmtest)
dwtest(model1)

install.packages("lm.beta")
library(lm.beta)
model2 <- lm.beta(model1)
summary(model2)

par(mfrow=c(1,2))
plot(model1)
avPlots(model1, id.n=2, id.cex=0.7)

outlierTest(model1)
influenceIndexPlot(model1, id.n=3)

a$pre <- model1$fitted.values
a$res <- model1$residuals

hist(a$res)

model3 <- lm(repurchase ~ satisf_i + satisf_b, data=a, x=TRUE, y=TRUE)
summary(model3)

result <- read.csv("mytelecom.csv", header = TRUE)

result2 <- lm(churn ~ tenure + income + age + factor(gender), data = result)
summary(result2)

#dummy
library(pequod)

a <- read.csv("cosmetics.csv", header = TRUE)
View(a)

dum.model1 <- lm(repurchase ~ satisf_b + satisf_i + factor(gender) + factor(decision), data = a, x= TRUE, y=TRUE)
anova(dum.model1)
summary(dum.model1)

a$gender <- factor(a$gender, levels = c(1,2), labels=c("male", "female"))
library(lm.beta)
dum.model2 <- lm.beta(dum.model1)
summary(dum.model2)

library(car)
a$repurchase_re <- recode(a$repurchase, "lo:3=0; 4:hi=1; else=NA")
library(aod)
library(Rcpp)
attach(a)

logit.model <- glm(repurchase_re~factor(propensity) + factor(decision)+ satisf_al, family=binomial)
summary(logit.model)
exp(cbind(OR=coef(logit.model), confint(logit.model)))

anova(logit.model, test="Chisq")
library(pscl)
pR2(logit.model)

a$pre <- logit.model$fitted.values
a$preGroup <- recode(a$pre, "lo:0.5=0; 0.5:hi=1")

library(gmodels)
CrossTable(x=a$repurchase_re, y=a$preGroup, chisq = TRUE)

model.fit1 <- predict(logit.model, type="response")
model.fit2 <- ifelse(model.fit1 > 0.5, 1, 0)
model.fit3 <- data.frame(model.fit2)

library(gmodels)
CrossTable(x=a$repurchase_re, y=model.fit3$model.fit2, chisq = TRUE)

library(ROCR)
pr <- prediction(model.fit1, repurchase_re)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc

#8.18 
health <- read.csv("health.csv", header = TRUE)
str(health)
View(health)

describe(health$허리둘레)
t.test(health$허리둘레, mu = 85.0)


groupA <- subset(health, 성별코드 == 1)
groupB <- subset(health, 성별코드 == 2)

groupAcount <- length(groupA$총콜레스테롤)
groupAmean <- round(mean(groupA$총콜레스테롤), 2)
groupAcount ; groupAmean

groupBcount <- length(groupB$총콜레스테롤)
groupBmean <- round(mean(groupB$총콜레스테롤), 2)
groupBcount ; groupBmean

groupcount <- c(groupAcount, groupBcount)
groupmean <- c(groupAmean, groupBmean)
grouptable <- data.frame(Freq=groupcount, Mean=groupmean)
grouptable

var.test(groupA$총콜레스테롤, groupB$총콜레스테롤)
wilcox.test(groupA$총콜레스테롤, groupB$총콜레스테롤)

#range(health$총콜레스테롤)
#health$총콜레스테롤2[health$총콜레스테롤 < 990] <- "상"
#health$총콜레스테롤2[health$총콜레스테롤 < 660] <- "중"
#health$총콜레스테롤2[health$총콜레스테롤 < 330] <- "하"
#
#a <- table(health$성별코드, health$총콜레스테롤2)
#chisq.test(a)

tapply(health$총콜레스테롤, health$흡연상태, nortest::ad.test, va)
bartlett.test(health$총콜레스테롤, health$흡연상태, data = health)
oneway.test(총콜레스테롤 ~ 흡연상태, data= health, var.equal = TRUE)
health.lm <- lm(총콜레스테롤 ~ 흡연상태, data= health)
anova(health.lm)  
model <- aov(총콜레스테롤 ~ 흡연상태, health)
comparison <- LSD.test(model, "흡연상태", p.adj = "bonferroni", group=T)
comparison

  
chisq.test(health$성별코드, health$총콜레스테롤2)

health$age[health$연령대코드.5세단위. < 20] <- 5
health$age[health$연령대코드.5세단위. < 16] <- 4
health$age[health$연령대코드.5세단위. < 12] <- 3
health$age[health$연령대코드.5세단위. < 8] <- 2
health$age[health$연령대코드.5세단위. <= 4] <- 1

health <- subset(health, 신장.5Cm단위. < 195)
View(health)
str(health)
range(health$신장.5Cm단위.)

chisq.test(health$age, health$신장.5Cm단위.)
range(health$연령대코드.5세단위.)

a <- health[,c("X.혈청지오티.AST", "X.혈청지오티.ALT", "감마지티피")]
a.cor <- cor(a)
a.cor
cor.pearson <- cor.test(~ X.혈청지오티.AST + X.혈청지오티.ALT, method = "pearson", data=health)
cor.pearson

corrplot(a.cor, method = "number")

health.lm <- lm(체중.5Kg.단위.~ 식전혈당.공복혈당. 
                  + 총콜레스테롤 
                  + 트리글리세라이드 
                  + 혈색소 
                  + 혈청크레아티닌 
                  + 감마지티피
                  + factor(흡연상태), data = health)
summary(health.lm)
vif(health.lm)

f.model = glm(체중.5Kg.단위.~., data = health)

r.model1=step(f.model, direction = "backward")

r.model2=step(f.model, direction = "forward")
r.model3=step(f.model, direction = "both")
is.na(health)
a <- table(is.na(health))
a

logit.model1 <- glm(음주여부 ~ 식전혈당.공복혈당.
                     + 총콜레스테롤 
                     + 트리글리세라이드 
                     + 혈색소 
                     + 혈청크레아티닌 
                     + 감마지티피
                     + factor(성별코드), data = health)

summary(logit.model1)
exp(cbind(OR=coef(logit.model1), confint(logit.model1)))

anova(logit.model1, test="Chisq")

health$pre <-logit.model1$fitted.values
health$preGroup <- recode(health$pre, "lo:0.5=0; 0.5:hi=1")
CrossTable(x=health$음주여부, y=health$preGroup, chisq=TRUE)

mdis <- read.csv("mdis.csv", header = TRUE)
View(mdis)
str(mdis)

table(is.na(mdis))
mdis <- subset(mdis,is.na(mdis)==FALSE )

table(mdis$연령)

chisq.test(mdis$연령, mdis$문7..귀하께서는.최근.인터넷을.언제.이용하셨습니까.)


mdis$attitude <- c((mdis$문19.._1..새로운.기술.및.제품에.잘.적응하는.편이다
                   + mdis$문19.._2..새로운.기술.및.제품을.이용할.때.스스로.활용방법을.습득할.자신이.있다
                   + mdis$문19.._3..새로운.기술.및.제품을.이용할.때.다른.사람들.보다.잘.하는.편이다
                   + mdis$문19.._4..나는.디지털기기를.사용하는.능력이.향후.지속적.경제활동에.있어서.매우.중요하다고.생각한다
                   + mdis$문19.._5..나는.새로운.기술을.적극적으로.배우려고.한다
                   + mdis$문19.._6..나는.내.자신을.평생.학습자라고.생각하고.필요한.교육.등을.즐겨.수강.한다)/6)

describe(mdis$attitude)
groupA <- subset(mdis, mdis$성별 == 1)
groupB <- subset(mdis, mdis$성별 == 2)

var.test(groupA$attitude, groupB$attitude)
wilcox.test(groupA$attitude, groupB$attitude)

table(mdis$연령)
mdis$self <- c((mdis$문6.._1..나는.인터넷을.통해.타인과.연결하고.소통할.수.있으며..문제해결.및.과업..과제.등을.위해.타인과.교류하고.협력할.수.있다.
               + mdis$문6.._2..나는.인터넷을.이용하여.정치..사회적.이슈나.문제에.대해.적극적으로.의견을.교류하고..공동의.문제를.해결하기.위해.토론..기부..봉사.등.다양한.활동에.참여할.수.있다.
               + mdis$문6.._3..나는.개인정보.노출..타인정보.유출.등.다양한.인터넷.이용의.위험요인으로부터.내자신과.다른.사람을.보호할.수.있다.
               + mdis$문6.._4..나는.불법.미디어.이용.및.타인.권리.침해.등을.하지.않는.책임.있는.인터넷.이용과.다른.사람의.의견을.이해하고.차이를.인정하며.수용할.수.있다.)/4)

describe(mdis$self)

tapply(mdis$self, mdis$연령, nortest::ad.test)
bartlett.test(mdis$self, mdis$연령, data=mdis)

mdis.lm <- lm(self~ 연령, data=mdis, var.equal=F)
#oneway.test(self~ 연령, data= mdis, var.equal=F)
aov(mdis.lm)

model <- aov(self~연령, mdis, var.equal=F)
comparison <- LSD.test(model, "연령", p.adj="bonferroni", group=T)
comparison

library(KoNLP)
useSejongDic()
mergeUserDic(data.frame("xxx", "ncn"))

data1 <- readLines("seoul_new.txt")
data1

data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
head(unlist(data2), 30)
data3 <- unlist(data2)
data3

data3 <- gsub("\\d+", "", data3)
data3 <- gsub("서울시", "", data3)
data3 <- gsub("서울", "", data3)
data3 <- gsub("요청", "", data3)
data3 <- gsub("제안", "", data3)
data3 <- gsub(" ", "", data3)
data3 <- gsub("-", "", data3)
data3

write(unlist(data3), "seoul_2.txt")
data4 <- read.table(("seoul_2.txt"))
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 20)

data3 <- gsub("OO", "", data3)
data3 <- gsub("개선", "", data3)
data3 <- gsub("문제", "", data3)
data3 <- gsub("관리", "", data3)
data3 <- gsub("민원", "", data3)
data3 <- gsub("이용", "", data3)
data3 <- gsub("관련", "", data3)
data3 <- gsub("시장", "", data3)
data3

write(unlist(data3), "seoul_3.txt")
data4 <- read.table("seoul_3.txt")
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 20)
data4

library(wordcloud)
library(RColorBrewer)
palete <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=1,
          random.order=F, random.color=T, colors=palete)
legend(0.3,1, "서울시 응답소 요청사항 분석", cex=0.8, fill=NA, border=NA, bg="white",
       text.col="red", text.font=2, box.col="red")

data1 <- readLines("remake.txt")
data1

data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2

data3 <- unlist(data2)

data3 <- Filter(function(x){nchar(x) <= 10}, data3)
head(unlist(data3), 30)
data3

data3 <- gsub("\\d+", "", data3)
data3 <- gsub("쌍수", "쌍꺼풀", data3)
data3 <- gsub("쌍커풀", "쌍꺼풀", data3)
data3 <- gsub("메부리코", "매부리코", data3)
data3 <- gsub("\\.", "", data3)
data3 <- gsub(" ", "", data3)
data3 <- gsub("\\'", "", data3)
data3

write(unlist(data3), "remark_2.txt")
data4 <- read.table("remark_2.txt")
data4

nrow(data4)
wordcount <- table(data4)
wordcount

head(sort(wordcount, decreasing = T), 20)
txt <- readLines("성형gsub.txt")
txt
cnt_txt <- length(txt)
cnt_txt
i <- 1
for(i in 1:cnt_txt){data3 <- gsub((txt[i]), "", data3)}
data3

data3 <- Filter(function(x){nchar(x) >= 2}, data3)
write(unlist(data3), "remake_2.txt")
data4 <- read.table("remake_2.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 30)

palete <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq=wordcount, scale=c(3,1), rot.per=0.25, min.freq=2,
          random.order = F, random.color = T, colors=palete)
legend(0.3,1, "여고생들이 선호하는 성형수술 부위", cex=0.8, fill=NA, border=NA, bg="white",
       text.col="black", text.font=2, box.col="red")

library(tm)
steve <- readLines("steve.txt")
corp99 <- VCorpus(VectorSource(steve))
inspect(corp99)

corp100 <- tm_map(corp99, stripWhitespace)
corp100 <- tm_map(corp100,tolower)
corp100 <- tm_map(corp100,removePunctuation)
corp100 <- tm_map(corp100,removeNumbers)

stopword200 <- c(stopwords('en'), "and", "but")
corp100 <- tm_map(corp100, removeWords, stopword200)
corp100 <- tm_map(corp100, PlainTextDocument)
corp101 <- TermDocumentMatrix(corp100)

findFreqTerms(corp101,3)
findAssocs(corp101,"apple",0.5)

corp102 <- as.matrix(corp101)
corp102

freq1 <- sort(rowSums(corp102), decreasing = T)

palete <- brewer.pal(7, "Set3")
wordcloud(names(freq1), freq=freq1, scale=c(5,1), rot.per=0.25, min.freq=2,
          random.order = F, random.color = T, colors = palete)

legend(0.3, 1, "steve 잡스 연설문 분석", cex=0.8, fill=NA, border=NA, bg="white",
       text.col="red", text.font=2, box.col="red")

data = readLines("crawlling.txt")
head(data)

library(wordcloud)
library(RColorBrewer)
library(KoNLP)

useSejongDic()

data <- sapply(data, extractNoun, USE.NAMES = F)
data_unlist <- unlist(data)
data_unlist <- Filter(function(x){nchar(x) >= 2}, data_unlist)
data_unlist <- gsub('[~!@#$%^&*()_+=?<>]','', data_unlist) 
data_unlist <- gsub('\\[','', data_unlist) 
data_unlist <- gsub('[ㄱ-ㅎ]','', data_unlist)
data_unlist <- gsub('(ㅜ|ㅠ)','', data_unlist)
data_unlist <- gsub('\\d+','', data_unlist)
data_unlist <- gsub('버스','', data_unlist)
data_unlist <- gsub('대전','', data_unlist)
data_unlist <- gsub('기사','', data_unlist)
data_unlist <- gsub('안녕','', data_unlist)
data_unlist <- gsub('오늘','', data_unlist)
data_unlist <- gsub('감사','', data_unlist)
data_unlist <- gsub('다음','', data_unlist)
data_unlist <- gsub('미준','', data_unlist)
data_unlist <- gsub('하기','', data_unlist)
data_unlist <- gsub('해서','', data_unlist)
data_unlist <- gsub('하시','', data_unlist)
data_unlist <- gsub('때문','', data_unlist)
data_unlist <- gsub('말씀','', data_unlist)
data_unlist <- gsub('','', data_unlist)
data_unlist <- gsub(' ','', data_unlist)
data_unlist <- gsub('  ','', data_unlist)
data_unlist <- gsub('   ','', data_unlist)
data_unlist <- gsub('    ','', data_unlist)
data_unlist <- gsub('     ','', data_unlist)

head(data_unlist)
wordcloud <- table(data_unlist)
head(wordcloud)

wordcount_top <- head(sort(wordcloud, decreasing = T), 100)
wordcount_top

install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(data=wordcount_top)

library(twitteR)
library(ROAuth)
library(base64enc)
library(devtools)
library(htmlwidgets)
library(htmltools)
library(jsonlite)
library(yaml)
library(tm)
library(wordcloud2)
library(KoNLP)
library(wordcloud)
library(plyr)

consumerKey <- "Yps3UvT071voAtV81jtXeYvRP"
consumerSecret <- "yDxciSweLYa2sX8rF4NyWe1vRTiRSYrvMIq60FqAQ1uQfVu9HD"
accessToken <- "1295910772543897600-y74tuBFUUdHgeyH2yoQGd0PrPXDWJd"
accessTokenSecret <- "KyZiKRKW2YBdes0bO9uttxKhz1AGOlJTfkyMJxdbjSWzE"
setup_twitter_oauth(consumerKey, consumerSecret, accessToken, accessTokenSecret)
keyword <- enc2utf8("AI")

AI <- searchTwitter(keyword, n=5000, lang="en", since="2020-08-01", "2020-08-17")
length(AI)
head(AI)

AI_twitter.df <- twListToDF(AI)
AI_twitter.text <- AI_twitter.df$text

write.table(AI_twitter.text, "tw.txt")
options(max.print=10000)

path <- paste0(getwd(), "/tw.txt")
tw_txt <- readLines(path)
tw_txt

tw_txt <- gsub("\\(CONTi-D\\", "", tw_txt)
tw_txt <- gsub("\\(CONTi-D\\", "", tw_txt)
tw_txt <- gsub("soleim", "", tw_txt)

last_number_of_lines <- length(readLines(path))
line_numbers <- seq(1, last_number_of_lines,1)

doc_ids <- line_numbers
df <- data.frame(doc_id = doc_ids, text = tw_txt, stringsAsFactors = FALSE)
tw_data <- Corpus(DataframeSource(df))
inspect(tw_data)

text_delete=c("artificialintelligence", "intelligence", "artificial", "...", "soleim", "<U+00A1>", "<U+00A6>")
tw_data <- tm_map(tw_data, removeWords, text_delete)

Sys.setlocale(category = "LC_ALL", locale =  "us")
tw_data <- tm_map(tw_data, stripWhitespace)
tw_data <- tm_map(tw_data, tolower)
tw_data <- tm_map(tw_data, removeNumbers)
tw_data <- tm_map(tw_data, removeWords, stopwords("english"))
tw_data <- tm_map(tw_data, removePunctuation)

inspect(tw_data)
stopwords("english")

tdm_tw <- TermDocumentMatrix(tw_data)
TDM1 <- as.matrix((tdm_tw))
v=sort(rowSums(TDM1), decreasing = TRUE)
profile=data.frame(word=names(v), freq=v)
head(profile, 10)

path2 <- paste0(getwd(), "/tw4.csv")
write.csv(profile, path2)

data <- read.csv(path2)
data <- data[,-1]
data <- data[-1,]
data_pick <- subset(data, freq>=30)
head(data_pick,20)

In_out_colors = "function(word,weight){return(weifht > 100) ? '#F3EF12':'#1EC612'}"
pal <- brewer.pal(12,"Paired")  
wordcloud2(data_pick,
           shape='circle',
           size = 0.5,
           color = pal,
           backgroundColor = "white")

hi <- read.csv("t1.csv", header = FALSE)
View(hi)

hi2 <- sapply(hi, extractNoun, USE.NAMES = F)
View(hi2)

hi3 <- unlist(hi2)
hi3 <- Filter(function(x){nchar(x)>=2}, hi3)
hi3 <- gsub("\\d+", "",hi3)
hi3 <- gsub('[~!@#$%^&*()_+=?<>]', "", hi3)
hi3 <- gsub("때문","",hi3)
hi3 <- gsub("~.","",hi3)
  
  
head(hi3)
wordcount <- table(hi3)
head(wordcount)

wordcount_top <- head(sort(wordcount, decreasing = T), 100)
wordcount_top

wordcloud2(data = wordcount_top)

last_number_of_lines <- length(hi3)
line_numbers <- seq(1, last_number_of_lines, 1)

doc_ids <- line_numbers
df <- data.frame(doc_id = doc_ids, text = hi3, stringsAsFactors = FALSE)
hi4 <- Corpus(DataframeSource(df))

text_delete=c("artificialintelligence", "intelligence", "artificial", "...", "soleim", "<U+00A1>", "<U+00A6>")
hi4 <- tm_map(hi4, removeWords, text_delete)

Sys.setlocale(category = "LC_ALL", locale =  "ko")
hi4 <- tm_map(tw_data, stripWhitespace)
hi4 <- tm_map(tw_data, removeNumbers)
hi4 <- tm_map(tw_data, removePunctuation)

inspect(hi4)

hi5 <- VCorpus(VectorSource(hi4))

hi6 <- as.matrix(hi5)

wordcloud2(wordcount_top,
           shape='circle',
           size = 0.5,
           color = pal,
           backgroundColor = "white")

#그래프활용
methods("plot")
install.packages("mlbench")
library(mlbench)
data(Ozone)
plot(Ozone$V8, Ozone$V9)

plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature")
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone")
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone", pch = 20)
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone", pch = "+")

plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone", cex = 1)
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone", col = "#FF0000")
max(Ozone$V8)

max(Ozone$V8, na.rm = TRUE)
max(Ozone$V9, na.rm = TRUE)
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone", xlim = c(0,100), ylim = c(0,90))


data(cars)
str(cars)
head(cars)
plot(cars)

plot(cars, type = "l")
plot(cars, type = "o", cex=0.5)

plot(tapply(cars$dist, cars$speed, mean))
plot(tapply(cars$dist, cars$speed, mean),
     type = "o", cex = 0.5, xlab="speed", ylab = "dist")

opar <- par(mfrow = c(1,2))
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone")
plot(Ozone$V8, Ozone$V9, xlab="Sandburg, Temperature", ylab = "EL Monte Temperature", main = "Ozone")
par(opar)

head(Ozone)
plot(Ozone$V6, Ozone$V7, xlab="Windspeed", ylab = "Humidity", main = "Ozone", pch = 20, cex = 5)
plot(jitter(Ozone$V6), jitter(Ozone$V7), xlab="Windspeed", ylab = "Humidity", main = "Ozone", pch = 20, cex = 5)

plot(iris$Sepal.Width, iris$Sepal.Length, cex=.5, pch=20, xlab = "width", ylab = "length", main = "iris")
points(iris$Petal.Width, iris$Petal.Length, cex = .5, pch="+", col = "#FF0000")

attach(iris)
plot(Sepal.Width, Sepal.Length, cex=.5, pch=20, xlab = "width", ylab = "length", main = "iris")
points(Petal.Width, Petal.Length, cex = .5, pch="+", col = "#FF0000")
with(iris, {plot(Sepal.Width, Sepal.Length, cex=.5, pch=20, xlab = "width", ylab = "length", main = "iris")})
points(Petal.Width, Petal.Length, cex = .5, pch="+", col = "#FF0000")

with(iris, {plot(NULL, xlim = c(0,5), ylim = c(0,10),
                 xlab = "width", ylab = "length", main = "iris", type = "n")
  points(Sepal.Width, Sepal.Length, cex=.5, pch=20)
  points(Petal.Width, Petal.Length, cex=.5, pch="+", col="#FF0000")})

x <- seq(00,2*pi, 0.1)
y <- sin(x)
plot(x, y, cex=.5, col="red")
lines(x,y)

library(mlbench)
data(cars)
head(cars)

plot(cars)
lines(lowess(cars))
plot(cars, xlim = c(0,25))
abline(a = -5, b=3.5, col="red")

plot(cars, xlim = c(0,25))
abline(a = -5, b=3.5, col="red")
abline(h = mean(cars$dist, lty = 2, col = "blue"))
abline(v = mean(cars$speed, lty = 2, col = "green"))

curve(sin,0,2*pi)

m <- lm(dist ~ speed, data=cars)
m
abline(m)
p <- predict(m, interval = "confidence")
head(p)
head(cars)
x <- c(cars$speed, tail(cars$speed,1), rev(cars$speed), cars$speed[1])
y <- c(p[, "lwr"], tail(p[, "upr"],1), rev(p[,"upr"]), p[,"lwr"][1])

m <- lm(dist ~speed, data= cars)
p <- predict(m, interval = "confidence")
plot(cars)
abline(m)

x <- c(cars$speed, tail(cars$speed,1), rev(cars$speed), cars$speed[1])
y <- c(p[, "lwr"], tail(p[, "upr"],1), rev(p[,"upr"]), p[,"lwr"][1])
polygon(x, y, col=rgb(.7, .7, .7, .5))


#ggmap
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap")

library(ggmap)
register_google(key= 'AIzaSyB8w6nGyWTD49iMwkNQuXLftOyPDuxkPLc')

map <- get_map(location="seoul", zoom=14, maptype="roadmap", source="google")
g <- ggmap(map)
print(g)

map <- get_map(location="seoul", zoom=14, maptype="satellite", source="google")
g <- ggmap(map)
print(g)

map <- get_map(location="seoul", zoom=14, maptype="toner-lite", source="google")
g <- ggmap(map)
print(g)

landmarks <- c("nseoul tower, seoul", "city hall, seoul")
lbls <- cbind(geocode(landmarks), text=landmarks)
g <- ggmap(map)
g <- g + geom_point(data = lbls, aes(x=lon, y=lat), size=5, colour = "orange")
g <- g + geom_point(data = lbls, aes(x=lon, y=lat), size=3, colour = "red")
g <- g + geom_text(data = lbls, aes(x=lon, y=lat, label=text), size=5, colour = "white", hjust=0, vjust=0)
print(g)

wifi = read.csv("WIFI.csv", header = TRUE)

View(a)
head(a)

attach(wifi)

bmap <- ggmap(get_googlemap(center = c("seoul"), zoom = 11, maptype = "roadmap")) + geom_point(data = wifi, aes(x=LON, y=LAT, colour= INSTL_DIV, size=4))
print(bmap)

bmap + facet_wrap(~INSTL_DIV)

ggplot(wifi, aes(x = factor(1))) +geom_bar(aes(fill = INSTL_DIV), width = 1) + coord_polar(theta = "y") + xlab("") +ylab("")

ggplot(wifi, aes(CATEGORY)) + geom_bar(aes(fill = INSTL_DIV))

ggplot(wifi, aes(INSTL_DIV)) + geom_bar(aes(fill = CATEGORY))

library(ggplot2)
library(ggmap)

pigmap <- ggmap(get_map(location = 'south korea', zoom=7, color='bw'))

pig15 <- read.csv("map.csv", header = TRUE, as.is=TRUE)
attach(pig15)
head(pig15)

ppp15 <- subset(pig15, 년도=="15")
ppp15map <- pigmap + geom_point(data=ppp15, aes(x=lon, y=lat))
ppp15map <- ppp15map + geom_text(data = ppp15, aes(x=lon+0.01, y=lat+0.01, label=위치))
ppp15map + geom_point(data = ppp15,
                      aes(x=lon, y=lat, color = factor(위치)),
                      size=2) + scale_color_discrete(name="위치")

getwd()

loc <- read.csv("서울_강동구_공영주차장_위경도.csv", header=TRUE)
loc

kd <- get_map("Amsa-dong", zoom=13, maptype =  "roadmap")

kor.map <- ggmap(kd) + geom_point(data=loc, aes(x=LON, y=LAT), size=3, alpha=0.7, color="red")
kor.map + geom_text(data=loc, aes(x = LON, y = LAT + 0.001, label=주차장명), size=3)

ggsave("kd.png", dpi=500)

pop <- read.csv("지역별인구현황_2014_4월기준.csv", header=TRUE)
pop

lon <- pop$LON
lat <- pop$LAT
data <- pop$총인구수

df <- data.frame(lon, lat, data)
df

map1 <- get_map("Jeonju", zoom=7, maptype = 'roadmap')
map1 <- ggmap(map1)
map1 + geom_point(aes(x=lon, y=lat, colour=data, size=data), data=df)
ggsave("pop.png", scale=1, width=7, height=4, dpi=1000)

map2 <- get_map("Jeonju", zoom=7, maptype = 'terrain')
map2 <- ggmap(map2)
map2 + geom_point(aes(x=lon, y=lat, colour=data, size=data), data=df)
ggsave("pop2.png", scale=1, width=7, height = 4, dpi=1000)

map3 <- get_map("Jeonju", zoom=7, maptype = 'satellite')
map3 <- ggmap(map3)
map3 + geom_point(aes(x=lon, y=lat, colour=data, size=data), data=df)
ggsave("pop3.png", scale=1, width=7, height = 4, dpi=1000)

map4 <- get_map("Jeonju", zoom=7, maptype = 'hybrid')
map4 <- ggmap(map4)
map4 + geom_point(aes(x=lon, y=lat, colour=data, size=data), data=df)
ggsave("pop4.png", scale=1, width=7, height = 4, dpi=700)

map5 <- get_map("Jeonju", zoom=7, maptype = 'roadmap')
map5 <- ggmap(map5)
map5 + stat_bin2d(aes(x=lon, y=lat, colour=data, fill=factor(data), size=data), data=df)
ggsave("pop5.png", scale=2, width=7, height = 4, dpi=700)

lonlat <- read.csv("MF1.csv", header = TRUE)

rmap <- ggmap(get_googlemap(center = c(127.6607, 36.0068), zoom = 7, maptype="roadmap")) + 
  geom_point(data=lonlat, aes(x=LON, y=LAT, color=RATE), size=2)
print(rmap)

rmap <- ggmap(get_googlemap(center = c(127.6607, 36.0068), zoom = 7, maptype="roadmap")) + 
  geom_point(data=lonlat, aes(x=LON, y=LAT, color=INCOME), size=2)
print(rmap)

rmap + facet_wrap(~RATE)
rmap + facet_wrap(~INCOME)

getwd()
health <- read.csv("checkup2.csv", header = TRUE)
head(health)
cent <- c(mean(health$lat), mean(health$lon))
attach(health)

bmap <- ggmap(get_googlemap(center = c("southkorea"), zoom=7, maptype = "roadmap")) +
  geom_point(data=health, aes(x=lon, y=lat, size=number), shape = 16, color = "purple", alpha = 0.5) +
  scale_size_area(max_size=10)
print(bmap)

library(xlsx)
people <- read.xlsx("checkup2.xlsx", sheetName = "Sheet1")
head(people)
cent <- c(mean(people$lat), mean(people$lon))
View(cent)
attach(people)
fmap <- ggmap(get_googlemap(center = c("southkorea"), zoom = 7, maptype = "roadmap")) +
  geom_point(data = people, aes(x=lon, y=lat, color = examinee), shape = 16, alpha = 0.9, size=3)
print(fmap)

names <- c("KOTE", "생산성본부", "종각역")
addr <- c("서울 종로구 인사동길 7", "서울 종로구 새문안로5가길 32", "서울 종로구 종로 55 종로 55")
geo <- geocode(enc2utf8(addr))
geo
jongro <- data.frame(name=names, lon=geo$lon, lat=geo$lat)
center <- c(mean(jongro$lon), mean(jongro$lat))
map <- get_googlemap(center=center, maptype = "roadmap", zoom=14, size = c(640,640), marker=geo)
ggmap(map)

#rshiny
library(shiny)
runExample("01_hello")
runExample("02_text")
runExample("03_reactivity")
runExample("04_mpg")
runExample("05_sliders")
runExample("06_tabsets")
runExample("07_widgets")
runExample("08_html")
runExample("09_upload")
runExample("10_download")
runExample("11_timer")

typeof(a)


