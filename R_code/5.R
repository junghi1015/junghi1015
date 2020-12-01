install.packages("caret")
library(caret)
set.seed(10011)
intrain <- createDataPartition(engel$engel2, p=0.7, list=FALSE)
train <- t[intrain,]
test <- t[-intrain,]

engel$engel2 <- recode(engel$engel, "lo:16.37=0; 16.37:hi=1")

hihi <- read.csv("hihi.csv", header = TRUE)
engel$inderstry <- as.factor(engel$inderstry)
intrain <- createDataPartition(y=hihi$engel, p=0.7, list=FALSE)
train <- df[intrain,]
test <- t[-intrain,]
View(intrain)


install.packages("tree")
library(tree)
set.seed(10011)
treemod <- tree(engel~., data = engel)
plot(treemod);text(treemod)

library(e1071)
treepred <- predict(prune.tree, test, type='class')

df <- data.frame(t$ID, t$SQ0A, t$SQ0B, t$SQ1, t$SQ2, t$SQ3A, t$SQ3, t$SQ4, t$SQ5, t$SQ5X, t$SQ5A, t$SQ6, t$SQ7A1, t$SQ7B1, t$SQ7C, t$SQ8B, t$consumer)

str(df)
head(df)

df2 <- c[,t$SQ0A, t$SQ0B]


df <- data.frame(t$SQ1, t$SQ2, t$SQ3A, t$SQ3, t$SQ4, t$SQ5, t$SQ5X, t$SQ5A, t$SQ6, t$SQ7A1, t$SQ7B1, t$SQ7C, t$SQ8B, t$consumer)


library(caret)
set.seed(10011)
intrain <- createDataPartition(y=df$t.SQ8B, p=0.7, list = FALSE)
train <- df[intrain,]
test <- df[-intrain,]

library(tree)
set.seed(10011)
treemod <- tree(t.SQ8B~., data=train)
plot(treemod);text(treemod)

table(hy$SQ5)

hy <- select(t, SQ3, SQ4, SQ5, SQ5A, SQ6, SQ7B1, SQ7B2, SQ7C, SQ8B)


hy$age[hy$SQ3==2|hy$SQ3==3] <- "20대"
hy$age[hy$SQ3==4|hy$SQ3==5|hy$SQ3==6] <- "30대이상"

hy$marry[hy$SQ4==1] <- "결혼"
hy$marry[hy$SQ4==2] <- "미혼"

hy$SQ5[is.na(hy$SQ5)] <- 0

hy$child[hy$SQ5==1|hy$SQ5==2] <- "자녀있음"
hy$child[hy$SQ5==3|hy$SQ5==0] <- "자녀없음"

hy$SQ5A[is.na(hy$SQ5A)] <- 0


hy$baby[hy$SQ5A==1] <- "36개월 이하 자녀있음"
hy$baby[hy$SQ5A==2|hy$SQ5A==0] <- "36개월 이하 자녀없음"


hy$job[hy$SQ6==1|hy$SQ6==2|hy$SQ6==3] <- "주부x"
hy$job[hy$SQ6==4] <- "전업주부"

hy$tissue[hy$SQ7B1==1] <- "일반물티슈사용중"
hy$tissue[hy$SQ7B2==2] <- "아기물티슈사용중"

hy$quality[hy$SQ7C==2|hy$SQ7C==3] <- "품질차이x"
hy$quality[hy$SQ7C==4|hy$SQ7C==5] <- "품질차이o"

hy$use[hy$SQ8B==1|hy$SQ8B==2|hy$SQ8B==3] <- "입,코,손"
hy$use[hy$SQ8B==4|hy$SQ8B==5|hy$SQ8B==6|hy$SQ8B==7|hy$SQ8B==8|hy$SQ8B==10|hy$SQ8B==12|hy$SQ8B==13] <- "입,코,손 외 사용"

hy2 <- select(hy, age, marry, child, baby, job, tissue, quality, use)

hy3 <- select(hy,SQ3, SQ4, SQ5, SQ5A, SQ6, SQ7B1, SQ7B2, SQ7C, SQ8B)

hy2 <- data.frame(hy, hy$age, hy$marry, hy$child, hy$baby, hy$job, hy$tissue, hy$quality, hy$use)


str(hy2)

hy2$age <- factor(hy2$age)
hy2$marry <- factor(hy2$marry)
hy2$child <- factor(hy2$child)
hy2$baby <- factor(hy2$baby)
hy2$job <- factor(hy2$job)
hy2$tissue <- factor(hy2$tissue)
hy2$quality <- factor(hy2$quality)
hy2$use <- factor(hy2$use)



library(caret)
set.seed(10011) 
intrain <- createDataPartition(y=hy2$use, p=0.7, list=FALSE)
train <- hy2[intrain, ]
test <- hy2[-intrain, ]

library(tree)
set.seed(10011)
treemod <- tree(use~. , data=train)
plot(treemod); text(treemod)

library(e1071)
treepred <- predict(prune.trees, test, type='class')
confusionMatrix(treepred, test$use)
set.seed(10011)
cv.trees <- cv.tree(treemod, FUN = prune.misclass)
plot(cv.trees)