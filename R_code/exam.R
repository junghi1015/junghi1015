service <- read.csv("service.csv", header = TRUE)
View(service)
library(Hmisc)
library(prettyR)
library(dplyr)
library(readxl)
library(XLConnect)
library(gmodels)
library(xlsx)
table(service)
prop.table(table(service))
round(prop.table(table(service))*100,1)

chisq.test(table(service))

car <- read.csv("carS.csv", header = TRUE)
View(car)      

table(car)           
chisq.test(car$family, car$carsize)

CrossTable(car$family, car$carsize, expected = TRUE, format="SPSS")

hi <- read.csv("영화관 만족도조사.csv", header=TRUE)
View(hi)

str(hi)
hi$environment <- round((hi$관람환경만족1 + hi$관람환경만족2 + hi$관람환경만족3)/3,1)

groupA <- subset(hi, hi$성별==1)
groupB <- subset(hi, hi$성별==2)

shapiro.test(groupA$environment)
shapiro.test(groupB$environment)

var.test(groupA$environment, groupB$environment)
describe(groupA)
describe(groupB)
t.test(groupA$environment, groupB$environment)
t.test(groupA$environment, groupB$environment, alter = "less", conf.level = 0.95)

#대응표본은 paired = TRUE 중요
rating <- read.csv("rating.csv", header = TRUE)
View(rating)

describe(rating$berating)
describe(rating$afrating)

var.test(rating$berating, rating$afrating, paired = TRUE)
wilcox.test(rating$berating, rating$afrating, paired = TRUE, alternative = "two.sided", conf.int=TRUE, conf.level = 0.95)

grape <- read.csv("grape.csv", header = TRUE)
View(grape)
str(grape)
grape.lm <- lm(price ~ size + period, data = grape)

#전체적인 설명력이 ~% 유의하고

summary(grape.lm)
vif(grape.lm)

#r포인트 분산분석
#r활용 비율검정







