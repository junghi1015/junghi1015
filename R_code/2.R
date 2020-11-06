hotels <- read.csv("data_all.csv", header=TRUE)
hotels
View(hotels)
summary(hotels)
typeof(hotels)
scale(hotels)
attributes(hotels)


attach(hotels)
shapiro.test(hotels)



cor.test(hotels$지역, hotels$등급)
cor.test(hotels$지역, hotels$공항까지_거리)
cor.test(hotels$등급, hotels$공항까지_거리)

AirPassengers
View(AirPassengers)

plot(hotels$후기_개수)

plot(hotels$후기_개수, hotels$평점, main = "후기&평점", sub = "Test", xlab = "후기", ylab = "평점", type = "p", col = "red")

chisq.test(hotels$평점)

op = par(mfrow = c(1,2))
interaction.plot(hotels$지역, hotels$등급, hotels$평점 , bty = 'l', main = "등급별 평점&지역", col = "red")
interaction.plot(hotels$지역, hotels$등급, hotels$공항까지_거리 , bty = 'l', main = "등급별 지역&거리", col = "blue")

data <- data.frame(hotels)
data <- t(data)

(m1 <- hclust(dist(data)^2, method = "single"))
plot(m1)
is.null(data)
is.na(data)

(m <- kmeans(hotels$등급,3))

table(hotels$지역, m$cluster)

plot(hotels[c("후기_개수", "평점")], main = "kmeans", col= m$cluster)

install.packages("cluster")
library(cluster)
result <- read.csv("data_all.csv", header=TRUE)
View(result)

result2 <- hclust(dist(result), method = "ave")
names(result2)
result2$order
plot(result2, hang = -1, labels =  result2$ID)

result3 <- kmeans(result, 3)
result3

plot(result[c("평점","거리")], col = result3$cluster)
points(result3$centers[, c("평점", "거리")], col = 1:3, pch = 8, cex = 2)
as.numeric(result$후기_개수)

View(result)

ggplot(data = result, aes(x= 거리, y = 평점, colour = 등급)) + geom_point() + geom_smooth()

#카이제곱
setwd("C:/rtest")
hotels <- read.csv("data_all2.csv", header = TRUE)

library(Hmisc)
library(prettyR)
View(hotels)

table(hotels$가격)
table(hotels[3])

prop.table(table(hotels$가격))
prop.table(table(hotels[3]))
prop.table(table(hotels$가격))*100
round(prop.table(table(hotels$평점))*100, 1)

surveyFreq <- c(table(hotels$가격))
surveyProp <- c(round(prop.table(table(hotels$가격))*100, 1))
surveytable <- data.frame(Freq=surveyFreq, Prop=surveyProp)
surveytable

describe(hotels)
describe(hotels$가격)

chisq.test(surveyFreq)
shapiro.test(surveyFreq)

str(hotels)
hotels$지역 <- as.numeric(hotels$지역)
hotels$가격 <- as.numeric(hotels$가격)
hotels$수영장_유무 <- as.numeric(hotels$수영장_유무)
hotels$후기_개수 <- as.numeric(hotels$후기_개수)


cor.pearson <- cor.test(~ hotels$후기_개수 + hotels$등급, method = "pearson", data = hotels)
cor.pearson

View(hotels)
cor(hotels)
plot(hotels)

pairs(hotels, panel=panel.smooth)

library(PerformanceAnalytics)
library(corrplot)

chart.Correlation(hotels, histogram= TRUE, pch=20)
hotels.cor <- cor(hotels)
hotels.cor

corrplot(hotels.cor, method = "ellipse")
corrplot(hotels.cor, method = "pie")
corrplot(hotels.cor, method = "number")
corrplot(hotels.cor, method = "color")
corrplot(hotels.cor, method = "shade")
corrplot(hotels.cor, method = "shade", addshade = "all", shade.col = FALSE,
         tl.col = "red", tl.srt = 30, diag = FALSE, addCoef.col = "white", order= "FPC")


hotels2 <- read.csv("data_all2.csv", header = TRUE)
View(hotels2)
hotels2$지역 <- as.numeric(hotels$지역)
hotels2$가격 <- as.numeric(hotels$가격)
hotels2$수영장_유무 <- as.numeric(hotels$수영장_유무)
str(hotels2)

hotels3 <- hclust(dist(hotels2), method = "ave")
names(hotels3)
hotels3$order
plot(hotels3, hang = -1, labels = hotels3$ID)
hotels3 <- kmeans(hotels2, 5)
hotels3

plot(hotels2[c("가격", "거리")], col = hotels3$cluster)

points(hotels3$centers[, c("가격", "거리")], col = 1:3, pch = 8, cex = 2)

#회귀분석

b <- read.csv("data_all2.csv", header = TRUE)
View(b)
#지역 평점 가격 거리 등급 수영장_유무 후기_개수
colnames(a) <- c("area", "star", "price", "distance", "grade", "pool", "review")
a$area <- as.numeric(a$area)
a$price <- as.numeric(a$price)
a$pool <- as.numeric(a$pool)
a$reivew <- as.numeric(a$review)             
str(a)
colnames(a) <- c("area", "star", "price", "distance", "grade", "pool", "1","review")
a <- subset(a, select = -7)
str(a)

a2 <- lm(review ~ factor(area) + factor(star) + distance + factor(grade) + factor(pool) + price, data = a)
a2
summary(a2)
vif(a2)

f.model = glm(review~factor(area) + factor(star) + distance + factor(grade) + factor(pool) + price, data = a)
r.model1 = step(f.model, direction = "backward")
r.model2 = step(f.model, direction = "forward")
r.model3 = step(f.model, direction = "both")

#로지스틱
b <- read.csv("data_all2.csv", header = TRUE)
View(b)
#지역 평점 가격 거리 등급 수영장_유무 후기_개수
colnames(a) <- c("area", "star", "price", "distance", "grade", "pool", "review")
a$area <- as.numeric(a$area)
a$price <- as.numeric(a$price)
a$pool <- as.numeric(a$pool)
a$reivew <- as.numeric(a$review)
str(a)
colnames(a) <- c("area", "star", "price", "distance", "grade", "pool", "1","review")
a <- subset(a, select = -7)
str(a)

library(aod)
library(Rcpp)
library(car)
a$area2 <- recode(a$area, "lo:1=0; 1:hi=1; else=NA")

logit.model <- glm(area2 ~ review + factor(star) + distance + factor(grade) + factor(pool) + price, data = a, family = binomial)
summary(logit.model)
exp(cbind(OR=coef(logit.model), confint(logit.model)))

anova(logit.model, test="Chisq")
library(pscl)
pR2(logit.model)

a$pre <- logit.model$fitted.values
a$preGroup <- recode(a$pre, "lo:0.5=0; 0.5:hi=1")
