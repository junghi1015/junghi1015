#1번 문제: 커피 전문점 선택 대안별 차이가 있는지 검증하시오.

coffee <- read.csv("coffee.csv", header = TRUE)
View(coffee)
library(prettyR)
library(Hmisc)
coffee1 <- c(coffee$선택요인)
coffee1
View(coffee1)
coffee2 <- coffee[3]
View(coffee2)

table(coffee2)
prop.table(table(coffee2))
prop.table(table(coffee2))*100
round(prop.table(table(coffee2))*100, 1)

choiceFreq <- c(table(coffee2))
choiceProp <- c(round(prop.table(table(coffee2))*100, 1))
choicetable <- data.frame(Freq=choiceFreq, Prop=choiceProp)
choicetable

describe(choicetable)
freq(choicetable)
chisq.test(choiceFreq)

#2번 문제: 성별에 따라 토익 점수에 차이가 있는지 검증하시오.

toeic <- read.csv("abroad.csv", header = TRUE)
table(toeic$성별, toeic$토익점수)
toeic$gender[toeic$성별==1] <- "남자"
toeic$gender[toeic$성별==2] <- "여자"
toeic$score[toeic$토익점수 <= 500] <- "하"
toeic$score[toeic$토익점수 > 500 & toeic$토익점수 <= 750] <- "중"
toeic$score[toeic$토익점수 > 750 & toeic$토익점수 < 999] <- "상"

View(toeic)
toeic

library(plyr)
table(toeic$gender, toeic$score)

chisq.test(toeic$gender, toeic$score)

install.packages("gmodels")
library(gmodels)

CrossTable(toeic$gender, toeic$score, expected = TRUE, format = "SPSS")
CrossTable(toeic$gender, toeic$score, expected = TRUE, format = "SAS")

#3번 문제: 해외연수 경험이 토익 점수에 영향을 주는지 검증하시오.

toeic <- read.csv("abroad.csv", header = TRUE)
View(toeic)

toeic$exp[toeic$해외연수경헙==1] <- "있다"
toeic$exp[toeic$해외연수경헙==2] <- "없다"
toeic$score[toeic$토익점수 < 999] <- "3"
toeic$score[toeic$토익점수 <= 750] <- "2"
toeic$score[toeic$토익점수 <= 500] <- "1"

chisq.test(toeic$exp, toeic$score)

CrossTable(toeic$exp, toeic$score, expected = TRUE, format="SPSS")
CrossTable(toeic$exp, toeic$score, expected = TRUE, format="SAS")

