library(agricolae)

engel <- read.csv("engel.csv", header = TRUE)
# 2019년 가구당 월평균 소비지출 2,457,000
t.test(engel$소비지출, mu = 2457000)

t.test(engel$engel, mu = 14.4)
View(engel$X01..식료품...비주류음료)
engel$engel <- round((engel$X01..식료품...비주류음료 / engel$소비지출)*100,1)
engel$freetime <- round((engel$X09..오락.문화 / engel$소비지출)*100,1)
engel$happy <- round((engel$X09..오락.문화/engel$X01..식료품...비주류음료)*100,1)
engel$happy[is.infinite(engel$happy)] <- 0

engel$hi1 <- round((engel$X02..주류...담배 / engel$소비지출)*100,1)
engel$hi2 <- round((engel$X03..의류...신발 / engel$소비지출)*100,1)
engel$hi3 <- round((engel$X04..주거...수도...광열 / engel$소비지출)*100,1)
engel$hi4 <- round((engel$X05..가정용품...가사서비스 / engel$소비지출)*100,1)
engel$hi5 <- round((engel$X06..보건 / engel$소비지출)*100,1)
engel$hi6 <- round((engel$X07..교통 / engel$소비지출)*100,1)
engel$hi7 <- round((engel$X10..교육 / engel$소비지출)*100,1)
engel$hi8 <- round((engel$X11..음식.숙박 / engel$소비지출)*100,1)
engel$hi9 <- round((engel$X12..기타.상품.및.서비스 / engel$소비지출)*100,1)
engel$hi10 <- round((engel$X08..통신 / engel$소비지출)*100,1)








mean(engel$happy)

mean(engel$engel)

View(engel)
str(engel)

range(engel$happy)

attach(engel)
detach(engel)

tapply(engel$가구주_산업코드, engel$engel, nortest::ad.test)

engel$inderstry[engel$가구주_산업코드 == "A"] <- 1
engel$inderstry[engel$가구주_산업코드 == "B"] <- 2
engel$inderstry[engel$가구주_산업코드 == "C"] <- 3
engel$inderstry[engel$가구주_산업코드 == "D"] <- 4
engel$inderstry[engel$가구주_산업코드 == "E"] <- 5
engel$inderstry[engel$가구주_산업코드 == "F"] <- 6
engel$inderstry[engel$가구주_산업코드 == "G"] <- 7
engel$inderstry[engel$가구주_산업코드 == "H"] <- 8
engel$inderstry[engel$가구주_산업코드 == "I"] <- 9
engel$inderstry[engel$가구주_산업코드 == "J"] <- 10
engel$inderstry[engel$가구주_산업코드 == "K"] <- 11
engel$inderstry[engel$가구주_산업코드 == "L"] <- 12
engel$inderstry[engel$가구주_산업코드 == "M"] <- 13
engel$inderstry[engel$가구주_산업코드 == "N"] <- 14
engel$inderstry[engel$가구주_산업코드 == "O"] <- 15
engel$inderstry[engel$가구주_산업코드 == "P"] <- 16
engel$inderstry[engel$가구주_산업코드 == "Q"] <- 17
engel$inderstry[engel$가구주_산업코드 == "R"] <- 18
engel$inderstry[engel$가구주_산업코드 == "S"] <- 19
engel$inderstry[engel$가구주_산업코드 == "T"] <- 20
engel$inderstry[engel$가구주_산업코드 == "U"] <- 21
engel$inderstry[engel$가구주_산업코드 == "V"] <- 22
engel$inderstry[engel$가구주_산업코드 == "W"] <- 23
engel$inderstry[engel$가구주_산업코드 == "X"] <- 24
engel$inderstry[engel$가구주_산업코드 == "Y"] <- 25
engel$inderstry[engel$가구주_산업코드 == "Z"] <- 26

tapply(engel$engel, engel$inderstry, nortest::ad.test)

bartlett.test(engel$engel, engel$inderstry, data=engel)

engel$배우자유무[engel$배우자유무 == 1] <- "동거"
engel$배우자유무[engel$배우자유무 == 2] <- "비동거"
engel$배우자유무[engel$배우자유무 == 3] <- "미혼"

table(engel$inderstry)
table(engel$inderstry)

engel <- engel[!(engel$inderstry == 21),]
engel <- engel[!(engel$inderstry == 2),]
engel <- engel[!(engel$inderstry == 20),]
engel <- engel[!(engel$inderstry == 26),]
engel <- engel[!(engel$inderstry == 4),]
engel <- engel[!(engel$inderstry == 5),]
engel <- engel[!(engel$inderstry == 3),]
engel <- engel[!(engel$inderstry == 1),]
engel <- engel[!(engel$inderstry == 2),]
engel <- engel[!(engel$inderstry == 6),]
engel <- engel[!(engel$inderstry == 7),]
engel <- engel[!(engel$inderstry == 9),]
engel <- engel[!(engel$inderstry == 17),]
engel <- engel[!(engel$inderstry == 8),]

table(engel$inderstry)
engel.lm <- lm(engel ~ inderstry, data=engel)
aov(engel ~ inderstry, engel, var.equal=F)
anova(engel.lm)
oneway.test(engel ~ inderstry,data = engel, var.equal=F)

model <- aov(engel ~ inderstry, engel, var.equal=F)
comparison <- LSD.test(model, "inderstry", p.adj = "bonferroni", group = T)
comparison

#엥겔지수는 가계 소비지출에서 식료품비가 차지하는 비율을 따져 가계의 생활수준을 가늠하는 척도로 
#25% 이하는 소득 최상위, 25∼30%는 상위, 30∼50%는 중위, 50∼70%는 하위, 70% 이상은 극빈층으로 정의된다.

engel$eval[engel$engel <= 25] <- "최상위"
engel$eval[engel$engel > 25 & engel$engel < 30] <- "상위"
engel$eval[engel$engel >= 30 & engel$engel < 50] <- "중위"
engel$eval[engel$engel >= 50 & engel$engel < 70] <- "하위"
engel$eval[engel$engel >= 70] <- "극빈층"


table(engel$eval, engel$inderstry)
chisq.test(engel$eval, engel$inderstry)

sample(x[x>8],8)

a <- sample(engel[engel$inderstry== 10], 100)
a <- engel[sample(nrow(engel),5)]


str(engel)
table(engel$배우자유무)

tapply(engel$engel, engel$배우자유무, nortest::ad.test)
bartlett.test(engel$engel, engel$배우자유무, data=engel)

engel.lm <- lm(engel ~ 배우자유무, data=engel)
aov(engel ~ 배우자유무, engel, var.equal=F)
anova(engel.lm, var.equal=F)
oneway.test(engel ~ 배우자유무,data = engel, var.equal=F)

model <- aov(engel ~ 배우자유무, engel, var.equal=F)
comparison <- LSD.test(model, "배우자유무", p.adj = "bonferroni", group = T)
comparison

tapply(engel$happy, engel$배우자유무, nortest::ad.test)
bartlett.test(engel$happy, engel$배우자유무, data=engel)

happy.lm <- lm(happy ~ 배우자유무, data=engel)
aov(happy ~ 배우자유무, engel, var.equal=F)
anova(happy, var.equal=F)
oneway.test(happy ~ 배우자유무,data = engel, var.equal=F)

model <- aov(happy ~ 배우자유무, engel, var.equal=F)
comparison <- LSD.test(model, "배우자유무", p.adj = "bonferroni", group = T)
comparison

table(engel$가구주_학력)

tapply(engel$engel, engel$가구주_학력, nortest::ad.test)
bartlett.test(engel$engel, engel$가구주_학력, data=engel)

engel.lm <- lm(engel ~ 가구주_학력, data=engel)
aov(engel ~ 가구주_학력, engel, var.equal=F)
anova(engel.lm, var.equal=F)
oneway.test(engel ~ 가구주_학력,data = engel, var.equal=F)

model <- aov(engel ~ 가구주_학력, engel, var.equal=F)
comparison <- LSD.test(model, "가구주_학력", p.adj = "bonferroni", group = T)
comparison

table(engel$소득구간)

tapply(engel$engel, engel$소득구간, nortest::ad.test)
bartlett.test(engel$engel, engel$소득구간, data=engel)

engel.lm <- lm(engel ~ 소득구간, data=engel)
aov(engel ~ 소득구간, engel, var.equal=F)
anova(engel.lm, var.equal=F)
oneway.test(engel ~ 소득구간,data = engel, var.equal=F)

model <- aov(engel ~ 소득구간, engel, var.equal=F)
comparison <- LSD.test(model, "소득구간", p.adj = "bonferroni", group = T)
comparison

library(ggplot2)
ggplot(engel.lm)

a <- subset(engel, engel$가구주_산업코드 == "J")
table(engel$취업인원수)

table(engel$가구주_산업코드)

str(engel)

cor.spearman <- cor.test(~ engel$inderstry + engel$engel, method="pearson", data=engel)
write.csv(engel, file="C:/rtest/hi123.csv")
hi123 <- read.csv("hi123.csv", header = TRUE)

str(hi123)
cor(hi123)

#산업별 엥겔, 여가, 행복 지수
table(engel$engel)
a<-round(mean(engel$engel[engel$inderstry==1]),1)
b<-round(mean(engel$engel[engel$inderstry==3]),1)
c<-round(mean(engel$engel[engel$inderstry==4]),1)
d<-round(mean(engel$engel[engel$inderstry==5]),1)
e<-round(mean(engel$engel[engel$inderstry==6]),1)
f<-round(mean(engel$engel[engel$inderstry==7]),1)
g<-round(mean(engel$engel[engel$inderstry==8]),1)
h<-round(mean(engel$engel[engel$inderstry==9]),1)
i<-round(mean(engel$engel[engel$inderstry==10]),1)
j<-round(mean(engel$engel[engel$inderstry==11]),1)
k<-round(mean(engel$engel[engel$inderstry==12]),1)
l<-round(mean(engel$engel[engel$inderstry==13]),1)
m<-round(mean(engel$engel[engel$inderstry==14]),1)
n<-round(mean(engel$engel[engel$inderstry==15]),1)
o<-round(mean(engel$engel[engel$inderstry==16]),1)
p<-round(mean(engel$engel[engel$inderstry==17]),1)
q<-round(mean(engel$engel[engel$inderstry==18]),1)
r<-round(mean(engel$engel[engel$inderstry==19]),1)

table(engel$freetime)
a1<-round(mean(engel$freetime[engel$inderstry==1]),1)
b1<-round(mean(engel$freetime[engel$inderstry==3]),1)
c1<-round(mean(engel$freetime[engel$inderstry==4]),1)
d1<-round(mean(engel$freetime[engel$inderstry==5]),1)
e1<-round(mean(engel$freetime[engel$inderstry==6]),1)
f1<-round(mean(engel$freetime[engel$inderstry==7]),1)
g1<-round(mean(engel$freetime[engel$inderstry==8]),1)
h1<-round(mean(engel$freetime[engel$inderstry==9]),1)
i1<-round(mean(engel$freetime[engel$inderstry==10]),1)
j1<-round(mean(engel$freetime[engel$inderstry==11]),1)
k1<-round(mean(engel$freetime[engel$inderstry==12]),1)
l1<-round(mean(engel$freetime[engel$inderstry==13]),1)
m1<-round(mean(engel$freetime[engel$inderstry==14]),1)
n1<-round(mean(engel$freetime[engel$inderstry==15]),1)
o1<-round(mean(engel$freetime[engel$inderstry==16]),1)
p1<-round(mean(engel$freetime[engel$inderstry==17]),1)
q1<-round(mean(engel$freetime[engel$inderstry==18]),1)
r1<-round(mean(engel$freetime[engel$inderstry==19]),1)

table(engel$happy)
a2<-round(mean(engel$happy[engel$inderstry==1]),1)
b2<-round(mean(engel$happy[engel$inderstry==3]),1)
c2<-round(mean(engel$happy[engel$inderstry==4]),1)
d2<-round(mean(engel$happy[engel$inderstry==5]),1)
e2<-round(mean(engel$happy[engel$inderstry==6]),1)
f2<-round(mean(engel$happy[engel$inderstry==7]),1)
g2<-round(mean(engel$happy[engel$inderstry==8]),1)
h2<-round(mean(engel$happy[engel$inderstry==9]),1)
i2<-round(mean(engel$happy[engel$inderstry==10]),1)
j2<-round(mean(engel$happy[engel$inderstry==11]),1)
k2<-round(mean(engel$happy[engel$inderstry==12]),1)
l2<-round(mean(engel$happy[engel$inderstry==13]),1)
m2<-round(mean(engel$happy[engel$inderstry==14]),1)
n2<-round(mean(engel$happy[engel$inderstry==15]),1)
o2<-round(mean(engel$happy[engel$inderstry==16]),1)
p2<-round(mean(engel$happy[engel$inderstry==17]),1)
q2<-round(mean(engel$happy[engel$inderstry==18]),1)
r2<-round(mean(engel$happy[engel$inderstry==19]),1)

table(engel$소비지출)
a3<-round(mean(engel$소비지출[engel$inderstry==1]),1)
b3<-round(mean(engel$소비지출[engel$inderstry==3]),1)
c3<-round(mean(engel$소비지출[engel$inderstry==4]),1)
d3<-round(mean(engel$소비지출[engel$inderstry==5]),1)
e3<-round(mean(engel$소비지출[engel$inderstry==6]),1)
f3<-round(mean(engel$소비지출[engel$inderstry==7]),1)
g3<-round(mean(engel$소비지출[engel$inderstry==8]),1)
h3<-round(mean(engel$소비지출[engel$inderstry==9]),1)
i3<-round(mean(engel$소비지출[engel$inderstry==10]),1)
j3<-round(mean(engel$소비지출[engel$inderstry==11]),1)
k3<-round(mean(engel$소비지출[engel$inderstry==12]),1)
l3<-round(mean(engel$소비지출[engel$inderstry==13]),1)
m3<-round(mean(engel$소비지출[engel$inderstry==14]),1)
n3<-round(mean(engel$소비지출[engel$inderstry==15]),1)
o3<-round(mean(engel$소비지출[engel$inderstry==16]),1)
p3<-round(mean(engel$소비지출[engel$inderstry==17]),1)
q3<-round(mean(engel$소비지출[engel$inderstry==18]),1)
r3<-round(mean(engel$소비지출[engel$inderstry==19]),1)

table(engel$가계지출)
a4<-round(mean(engel$가계지출[engel$inderstry==1]),1)
b4<-round(mean(engel$가계지출[engel$inderstry==3]),1)
c4<-round(mean(engel$가계지출[engel$inderstry==4]),1)
d4<-round(mean(engel$가계지출[engel$inderstry==5]),1)
e4<-round(mean(engel$가계지출[engel$inderstry==6]),1)
f4<-round(mean(engel$가계지출[engel$inderstry==7]),1)
g4<-round(mean(engel$가계지출[engel$inderstry==8]),1)
h4<-round(mean(engel$가계지출[engel$inderstry==9]),1)
i4<-round(mean(engel$가계지출[engel$inderstry==10]),1)
j4<-round(mean(engel$가계지출[engel$inderstry==11]),1)
k4<-round(mean(engel$가계지출[engel$inderstry==12]),1)
l4<-round(mean(engel$가계지출[engel$inderstry==13]),1)
m4<-round(mean(engel$가계지출[engel$inderstry==14]),1)
n4<-round(mean(engel$가계지출[engel$inderstry==15]),1)
o4<-round(mean(engel$가계지출[engel$inderstry==16]),1)
p4<-round(mean(engel$가계지출[engel$inderstry==17]),1)
q4<-round(mean(engel$가계지출[engel$inderstry==18]),1)
r4<-round(mean(engel$가계지출[engel$inderstry==19]),1)

table(engel$hi1)
aa1<-round(mean(engel$hi1[engel$inderstry==1]),1)
bb1<-round(mean(engel$hi1[engel$inderstry==3]),1)
cc1<-round(mean(engel$hi1[engel$inderstry==4]),1)
dd1<-round(mean(engel$hi1[engel$inderstry==5]),1)
ee1<-round(mean(engel$hi1[engel$inderstry==6]),1)
ff1<-round(mean(engel$hi1[engel$inderstry==7]),1)
gg1<-round(mean(engel$hi1[engel$inderstry==8]),1)
hh1<-round(mean(engel$hi1[engel$inderstry==9]),1)
ii1<-round(mean(engel$hi1[engel$inderstry==10]),1)
jj1<-round(mean(engel$hi1[engel$inderstry==11]),1)
kk1<-round(mean(engel$hi1[engel$inderstry==12]),1)
ll1<-round(mean(engel$hi1[engel$inderstry==13]),1)
mm1<-round(mean(engel$hi1[engel$inderstry==14]),1)
nn1<-round(mean(engel$hi1[engel$inderstry==15]),1)
oo1<-round(mean(engel$hi1[engel$inderstry==16]),1)
pp1<-round(mean(engel$hi1[engel$inderstry==17]),1)
qq1<-round(mean(engel$hi1[engel$inderstry==18]),1)
rr1<-round(mean(engel$hi1[engel$inderstry==19]),1)


hi <- cbind(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r)
hi1 <- cbind(a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1,q1,r1)
hi2 <- cbind(a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2,q2,r2)
hi3 <- cbind(a3,b3,c3,d3,e3,f3,g3,h3,i3,j3,k3,l3,m3,n3,o3,p3,q3,r3)
hi4 <- cbind(a4,b4,c4,d4,e4,f4,g4,h4,i4,j4,k4,l4,m4,n4,o4,p4,q4,r4)

hi
hi1
is.infinite(hi2)
hi3
hi4

hihi1 <- cbind(aa1,bb1,cc1,dd1,ee1,ff1,gg1,hh1,ii1,jj1,kk1,ll1,mm1,nn1,oo1,pp1,qq1,rr1)

hihi1



hi <- sort(hi, decreasing = T)
barplot(hi)
table(engel$inderstry)

hihi <- read.csv("hihi.csv", header = TRUE)
hihi

inder_engel <- read.csv("inder_engel.csv", header = TRUE)
inder_engel

inder_engel2 <- read.csv("inder_engel2.csv", header = TRUE)
inder_engel2

inder_engel2 <- cbind(inder_engel$inderstry, inder_engel$engel)

library(ggplot2)

qplot(data=inder_engel, engel, fill=inderstry ,geom="bar")

inder_engel$inderstry <- as.factor(inder_engel$inderstry)
str(inder_engel)
table(engel$inderstry)


engel$X09..오락.문화
qplot(engel, happy, data = engel, geom=c("point", "smooth"))

engel$inderstry <- as.factor(engel$inderstry)

ggplot(data=engel,
       mapping = aes(x = engel,
                     y = happy)) + geom_point(colour = engel$inderstry)

ggplot(data=hihi,
       mapping = aes(x = engel,
                     y = freetime)) + 
        geom_line(colour = inder_engel2$inderstry) + 
        geom_point(colour = inder_engel2$inderstry, lwd=3)


legend("topright", c("fd","fds","fd1","fds1","fd2","fds2","fd3","fds3","fd4","fds4","fd5","fds5","fd6","fds6","fd7","fds7","fd8","fds8"),col = c(1:18),lty=c(1:18))


ggplot(data=inder_engel2,
       mapping = aes(x = engel,
                     y = happy, 
                     group=inderstry, 
                     color=inderstry )) + geom_line(lwd=2)

inder_engel2$inderstry <- as.factor(inder_engel2$inderstry)
str(inder_engel2)

library(car)

engel.lm <- lm(engel ~ 곡물 +
                       곡물가공품 +
                       빵.및.떡류 +
                       육류 +
                       육류가공품 +
                       신선수산동물 +
                       염건수산동물 +
                       기타수산동물가공 +
                       유제품.및.알 +
                       유지류 +
                       과일.및.과일가공품 +
                       채소.및.채소가공품 +
                       해조.및.해조가공품 +
                       당류.및.과자류 +
                       조미식품 +
                       기타식품 +
                       커피.및.차 +
                       쥬스.및.기타음료, data=engel)

vif(engel.lm)
summary(engel.lm)
plot(engel.lm)

happy.lm <- lm(happy ~ 영상음향기기 +
                        사진광학장비 +
                        정보처리장치 +
                        기록매체 +
                        영상음향.및.정보기기수리 +
                        오락문화.내구재 +
                        악기기구 +
                        오락문화내구재.유지.및.수리 +
                        장난감.및.취미용품 +
                        캠핑.및.운동관련용품 +
                        화훼관련용품 +
                        애완동물관련물품 +
                        화훼.및.애완동물서비스 +
                        운동.및.오락서비스 +
                        문화서비스 +
                        복권 +
                        서적 +
                        기타인쇄물 +
                        문구 +
                        단체여행비, data= engel)

summary(happy.lm)
vif(happy.lm)
plot(happy.lm)

test.lm <- lm(engel ~ 가구원수 +
                      factor(가구주_성별) +
                      factor(배우자유무) +
                      factor(입주형태) +
                      factor(가구구분), data=engel)

summary(test.lm)

test.lm2 <- lm(happy ~ 가구원수 +
                      factor(가구주_성별) +
                      factor(배우자유무) +
                      factor(입주형태) +
                      factor(가구구분), data=engel)

summary(test.lm2)

engel3 <- read.csv("engel3.csv", header = TRUE)
mean(engel$engel)

engel$engel2 <- recode(engel$engel, "lo:16.37=0; 16.37:hi=1")
View(engel)
engel_ran <- randomForest(formula = engel ~ 곡물 +
                             곡물가공품 +
                             빵.및.떡류 +
                             육류 +
                             육류가공품 +
                             신선수산동물 +
                             염건수산동물 +
                             과일.및.과일가공품 +
                             유제품.및.알 +
                             해조.및.해조가공품 +
                             기타수산동물가공 +
                             채소.및.채소가공품 +
                             해조.및.해조가공품 +
                             당류.및.과자류 +
                             조미식품 +
                             기타식품 +
                             커피.및.차 +
                             쥬스.및.기타음료 +
                             유지류 ,
                                data = engel, na.action = na.omit,
                   importance = FALSE, ntree = 500 ,proximity = TRUE)

#유지류, 커피.및.차 +, 빠짐
library(randomForest)
engel_ran
importance(test)
varImpPlot(engel_ran)

#%IncMSE = 정확도, IncNodePurity = 중요도 출력

range(test2$happy)
test2$happy_re <- recode(test2$happy, "lo:6.03=0; 6.03:hi=1")


test2 <- read.csv("hi1234.csv", header = TRUE)
freetime_ran <- randomForest(formula = freetime ~ 영상음향기기 +
                               정보처리장치 +
                               기록매체 +
                               오락문화.내구재 +
                               악기기구 +
                               사진광학장비 +
                               장난감.및.취미용품 +
                               캠핑.및.운동관련용품 +
                               화훼관련용품 +
                               애완동물관련물품 +
                               화훼.및.애완동물서비스 +
                               운동.및.오락서비스 +
                               영상음향.및.정보기기수리 +
                               문화서비스 +
                               기타인쇄물 +
                               복권 +
                               서적 +
                               오락문화내구재.유지.및.수리 +
                               영상음향.및.정보기기수리 +
                               문구 +
                               단체여행비 ,
                     data = engel, na.action = na.omit, 
                     importance = FALSE, ntree=500, proximity = TRUE)

#오락문화내구재.유지.및.수리 +, 영상음향.및.정보기기수리 +, 사진광학장비 +, 기록매체 +
freetime_ran
importance(test22)
varImpPlot(freetime_ran)

#%IncMSE = 정확도, IncNodePurity = 중요도 출력

happy_ran <- randomForest(formula = happy ~ 곡물 +
                                  곡물가공품 +
                                  빵.및.떡류 +
                                  육류 +
                                  육류가공품 +
                                  신선수산동물 +
                                  염건수산동물 +
                                  과일.및.과일가공품 +
                                  유제품.및.알 +
                                  해조.및.해조가공품 +
                                  기타수산동물가공 +
                                  채소.및.채소가공품 +
                                  해조.및.해조가공품 +
                                  당류.및.과자류 +
                                  조미식품 +
                                  기타식품 +
                                  커피.및.차 +
                                  쥬스.및.기타음료 +
                                  유지류 +
                                  영상음향기기 +
                                  정보처리장치 +
                                  기록매체 +
                                  오락문화.내구재 +
                                  악기기구 +
                                  사진광학장비 +
                                  장난감.및.취미용품 +
                                  캠핑.및.운동관련용품 +
                                  화훼관련용품 +
                                  애완동물관련물품 +
                                  화훼.및.애완동물서비스 +
                                  운동.및.오락서비스 +
                                  영상음향.및.정보기기수리 +
                                  문화서비스 +
                                  기타인쇄물 +
                                  복권 +
                                  서적 +
                                  오락문화내구재.유지.및.수리 +
                                  영상음향.및.정보기기수리 +
                                  문구 +
                                  단체여행비 ,
                                 data = engel, na.action = na.omit, 
                                 importance = FALSE, ntree=500, proximity = TRUE)

happy_ran
importance(test33)

varImpPlot(happy_ran)

#맞벌이 = 의미없음
var.test(engel$happy, engel$맞벌이가구, data=engel)
groupA <- subset(engel, 맞벌이가구==0)
groupB <- subset(engel, 맞벌이가구==1)
wilcox.test(groupA$happy, groupB$happy)

#성별

var.test(engel$happy, engel$가구주_성별, data=engel)
groupA <- subset(engel, 가구주_성별==1)
groupB <- subset(engel, 가구주_성별==2)
wilcox.test(groupA$happy, groupB$happy)
mean(groupA$happy)
mean(groupB$happy)


#배우자유무
bartlett.test(engel$happy, engel$배우자유무, data=engel)
earn.lm <- lm(happy ~ 배우자유무, data=engel)
oneway.test(happy ~ 배우자유무, data=engel, var.equal=FALSE)
model <- aov(happy ~ 배우자유무, engel, var.equal=FALSE)

comparison <- LSD.test(model, "배우자유무", p.adj="bonferroni", group=T)
comparison


#배우자유무_엥겔
bartlett.test(engel$engel, engel$배우자유무, data=engel)
earn.lm <- lm(engel ~ 배우자유무, data=engel)
oneway.test(engel ~ 배우자유무, data=engel, var.equal=FALSE)
model <- aov(engel ~ 배우자유무, engel, var.equal=FALSE)

comparison <- LSD.test(model, "배우자유무", p.adj="bonferroni", group=T)
comparison


#배우자유무_여가
bartlett.test(engel$freetime, engel$배우자유무, data=engel)
earn.lm <- lm(freetime ~ 배우자유무, data=engel)
oneway.test(freetime ~ 배우자유무, data=engel, var.equal=FALSE)
model <- aov(freetime ~ 배우자유무, engel, var.equal=FALSE)

comparison <- LSD.test(model, "배우자유무", p.adj="bonferroni", group=T)
comparison



#산업군_행복
bartlett.test(engel$happy, engel$inderstry, data=engel)
earn.lm <- lm(happy ~ inderstry, data=engel)
oneway.test(happy ~ inderstry, data=engel, var.equal=FALSE)
model <- aov(happy ~ inderstry, engel, var.equal=FALSE)

comparison <- LSD.test(model, "inderstry", p.adj="bonferroni", group=T)
comparison

#산업군_엥겔
bartlett.test(engel$engel, engel$inderstry, data=engel)
earn.lm <- lm(engel ~ inderstry, data=engel)
oneway.test(engel ~ inderstry, data=engel, var.equal=FALSE)
model <- aov(engel ~ inderstry, engel, var.equal=FALSE)

comparison <- LSD.test(model, "inderstry", p.adj="bonferroni", group=T)
comparison

#산업군_여가
bartlett.test(engel$freetime, engel$inderstry, data=engel)
earn.lm <- lm(freetime ~ inderstry, data=engel)
oneway.test(freetime ~ inderstry, data=engel, var.equal=FALSE)
model <- aov(freetime ~ inderstry, engel, var.equal=FALSE)

comparison <- LSD.test(model, "inderstry", p.adj="bonferroni", group=T)
comparison





#세대구분 = 쓸만하지 않는듯
bartlett.test(engel$happy, engel$세대구분, data=engel)
earn.lm <- lm(happy ~ 세대구분, data=engel)
oneway.test(happy ~ 세대구분, data=engel, var.equal=FALSE)
model <- aov(happy ~ 세대구분, engel, var.equal=FALSE)

comparison <- LSD.test(model, "세대구분", p.adj="bonferroni", group=T)
comparison

library(agricolae)

#배우자유무_j산업군
bartlett.test(each$happy, each$배우자유무, data=each)
earn.lm <- lm(happy ~ 배우자유무, data=each)
oneway.test(happy ~ 배우자유무, data=each, var.equal=FALSE)
model <- aov(happy ~ 배우자유무, each, var.equal=FALSE)

comparison <- LSD.test(model, "배우자유무", p.adj="bonferroni", group=T)
comparison


chisq.test(engel$inderstry, engel$소득구간)



#소득구간별_엥겔
bartlett.test(engel$engel, engel$소득구간, data=engel)
earn.lm <- lm(engel ~ 소득구간, data=engel)
oneway.test(engel ~ 소득구간, data=engel, var.equal=FALSE)
model <- aov(engel ~ 소득구간, engel, var.equal=FALSE)

comparison <- LSD.test(model, "소득구간", p.adj="bonferroni", group=T)
comparison

#소득구간별_여가
bartlett.test(engel$freetime, engel$소득구간, data=engel)
earn.lm <- lm(freetime ~ 소득구간, data=engel)
oneway.test(freetime ~ 소득구간, data=engel, var.equal=FALSE)
model <- aov(freetime ~ 소득구간, engel, var.equal=FALSE)

comparison <- LSD.test(model, "소득구간", p.adj="bonferroni", group=T)
comparison

#소득구간별_행복
bartlett.test(engel$happy, engel$소득구간, data=engel)
earn.lm <- lm(happy ~ 소득구간, data=engel)
oneway.test(happy ~ 소득구간, data=engel, var.equal=FALSE)
model <- aov(happy ~ 소득구간, engel, var.equal=FALSE)

comparison <- LSD.test(model, "소득구간", p.adj="bonferroni", group=T)
comparison



install.packages("gplots")
install.packages("rgl")
install.packages("ca")

library(rgl)
install.packages("caret")
library(caret)
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))

describe(engel$engel)
describe(engel$freetime)
describe(engel$happy)

x <- rnorm(100, mean = 16.36, sd=10.17)
y <- rnorm(100, mean = 6.05, sd=6.44)
z <- rnorm(100, mean = 68.4, sd=272.38)

plot_ly(x=x, y=y, z=z, type="scatter3d", mode="markers", color=x)

a <- engel$배우자유무[sample(nrow(engel),5)]
library(plotly)

years <- read.csv('years.csv', header = TRUE)
years2 <- subset(years, 배우자유무 ==1 | 배우자유무 == 3)
years2$배우자유무[years2$배우자유무==3] <- 2
years2$배우자유무[years2$배우자유무==1] <- 1


years2$배우자유무[years2$배우자유무==2] <- '2:없음'
years2$배우자유무[years2$배우자유무==1] <- '1:있음'

x <- years2$engel
y <- years2$happy
z <- years2$배우자유무
plot_ly(x=x, y=y, z=z, type="scatter3d", mode="markers", color=z )

years2$fish_or_not[years2$연차구분==1 | years2$연차구분==2] <- 1
years2$fish_or_not[years2$연차구분==3 | years2$연차구분==4 | years2$연차구분==5 | years2$연차구분==6] <- 2


years <- read.csv('years.csv', header = TRUE)

years2$연차구분[years2$연차구분==1] <- '1년차 이하'
years2$연차구분[years2$연차구분==2] <- '1~5년차'
years2$연차구분[years2$연차구분==3] <- '6~10년차'
years2$연차구분[years2$연차구분==4] <- '11~15년차'
years2$연차구분[years2$연차구분==5] <- '16~20년차'
years2$연차구분[years2$연차구분==6] <- '21년차 이상'





x <- years2$engel
y <- years2$happy
z <- years2$배우자유무
plot_ly(x=x, y=y, z=z, type="scatter3d", mode="markers", color=z )

#J_배우자유무_엥겔
bartlett.test(years2$engel, years2$배우자유무, data=years2)
earn.lm <- lm(engel ~ 배우자유무, data=years2)
oneway.test(engel ~ 배우자유무, data=years2)
model <- aov(engel ~ 배우자유무, years2)

comparison <- LSD.test(model, "배우자유무", p.adj="bonferroni", group=T)
comparison

#J_배우자유무_여가
bartlett.test(years2$freetime, years2$배우자유무, data=years2)
earn.lm <- lm(freetime ~ 배우자유무, data=years2)
oneway.test(freetime ~ 배우자유무, data=years2, var.equal=FALSE)
model <- aov(freetime ~ 배우자유무, years2)

comparison <- LSD.test(model, "배우자유무", p.adj="bonferroni", group=T)
comparison



plot_ly(x=x, y=y, z=z, type="scatter3d", mode="markers", color=years2$배우자유무)


a <- subset(years, 배우자유무==1)
b <- subset(years, 배우자유무==3)
x <- b$engel
y <- b$freetime
z <- b$연차구분


plot_ly(x=x, y=y, z=z, type="scatter3d", mode="markers", color=z)

x <- test91$inderstry
y <- test91$engel
z <- test91$freetime

plot_ly(x=x, y=y, z=z, type="scatter3d", mode="markers", color=z)


test91 <- read.csv('test91.csv', header = TRUE)


library(plotly)
library(plot3D)

x <- engel$engel
y <- engel$freetime
z <- engel$배우자유무
plot3d.cd(x, y, z, col=rainbow(1000))
plot3d(x, y, z, col=rainbow(1000),options(scipen=10000))




rownames(IQ3_plus) <- c("Clean country", "Good house", "Codi", "Kleenex")
fit2 <- ca(IQ3_plus)
print(fit2) # basic results 
summary(fit2) # extended results 
plot(fit2) # symmetric map 
plot(ca(t))
plot(fit2, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map
plot3d.ca(ca(t, nd=4), col = c("#6666FF","#FF6666"))
plot3d.ca(fit2)



install.packages("FactoMineR")
library(ca)
library(FactoMineR)
library(factoextra)

library(gplots)
# 1. convert the data as a table
dt <- as.table(as.matrix(inder_engel))
# 2. Graph
balloonplot(t(dt), main ="engel", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)
library(dplyr)

ca(X, ncp = 5, graph = TRUE)
res.ca <- ca(inder_engel, graph = TRUE)
table(inder_engel)
biplot(inder_engel$engel, inder_engel$happy)
plot(ca(inder_engel))
inder_engel3 <- subset()
ie <- select(inder_engel, engel, happy)
plot(a, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE))
plot3d.ca(ca(inder_engel2, nd=4), col = c("#6666FF","#FF6666"))
library(ca)

inder_engel3 <- read.csv("inder_engel3.csv", header = TRUE)
s <- read.csv("IQ3_plus.csv", header = TRUE)
test2 <- read.csv("test2.csv", header = TRUE)
test7 <- read.csv("test7.csv", header = TRUE)  
test5 <- read.csv("test5.csv", header = TRUE)
test6 <- read.csv("test6.csv", header = TRUE)
test1015 <- read.csv("test1015.csv", header = TRUE)
test5$X <- as.factor(test5$X)

str(inder_engel3)
biplot(inder_engel3$engel, inder_engel3$happy)
plot3d.ca(inder_engel3)

update.packages()
a<-ca(inder_engel2)
h <- ca(test2)
k <- ca(test5)
h <- ca(test6)
a <- ca(test7)
k <- ca(test1015)


plot(a)
plot(ca(t))

s <- ca(s)

hihi<- ca(hihi)

summary(a)
summary(t)
summary(test2)
summary(k)

str(k)
print(fit2) # basic results 
summary(fit2) # extended results 
plot(a) # symmetric map
plot(ca(t))

#a <- inder_engel2, input a later
plot(k, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map

plot3d.ca(ca(test5, nd=10), col = c("#6666FF","#FF6666"))
plot3d.ca(h)

plot3d.ca(k)

library(plotly)
plot_ly(data = each, x = ~engel, y = ~freetime, color = ~years)

each <- read.csv("가계동향조사_J개인.csv", header=TRUE)

test555 <- read.csv("test555.csv", header = TRUE)
a <- ca(test555)
plot(a, mass = TRUE, contrib = "absolute", map = "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map
plot3d.ca(a)


table(engel$배우자유무)
a <- subset(engel, 배우자유무=="동거")
b <- subset(engel, 배우자유무=="비동거")
c <- subset(engel, 배우자유무=="미혼")
table(a$가구주_성별)
table(b$가구주_성별)
table(c$가구주_성별)
library(psych)


a <- subset(engel, inderstry==10)

mean(a$freetime)


library(plotly)

data <- read.csv('money1.csv', header=TRUE)

top_labels <- c('200만원 미만', '200~300만원', '300~400만원', '400~500만원', '500~600만원','600만원 이상')


fig <- plot_ly(data, x = ~X1, y = ~inderstry, type = 'bar', orientation = 'h',
               marker = list(color = 'rgba(38, 24, 74, 0.8)',
                             line = list(color = 'rgb(248, 248, 249)', width = 1)), name = '200만원 미만') 
fig <- fig %>% add_trace(x = ~X2, marker = list(color = 'rgba(71, 58, 131, 0.8)'), name = '200~300만원') 
fig <- fig %>% add_trace(x = ~X3, marker = list(color = 'rgba(122, 120, 168, 0.8)'), name = '300~400만원') 
fig <- fig %>% add_trace(x = ~X4, marker = list(color = 'rgba(164, 163, 204, 0.85)'), name = '400~500만원') 
fig <- fig %>% add_trace(x = ~X5, marker = list(color = 'rgba(190, 192, 213, 1)'), name = '500~600만원') 
fig <- fig %>% add_trace(x = ~X6, marker = list(color = 'rgba(214, 108, 232, 1)'), name = '600만원 이상') 
fig <- fig %>% layout(xaxis = list(title = "",
                                   showgrid = FALSE,
                                   showline = FALSE,
                                   showticklabels = FALSE,
                                   zeroline = FALSE,
                                   domain = c(0.15, 1)),
                      yaxis = list(title = "",
                                   showgrid = FALSE,
                                   showline = FALSE,
                                   showticklabels = FALSE,
                                   zeroline = FALSE),
                      barmode = 'stack',
                      paper_bgcolor = 'rgb(248, 248, 255)', plot_bgcolor = 'rgb(248, 248, 255)',
                      margin = list(l = 120, r = 10, t = 140, b = 80),
                      showlegend = TRUE,
                      legend = list(x = 0.55, y = 1.08,
                                    font = list(size = 14),
                                    orientation = 'h', xanchor = "center", traceorder='normal')) 
# labeling the y-axis
fig <- fig %>% add_annotations(xref = 'paper', yref = 'inderstry', x = 0.14, y = data$inderstry,
                               xanchor = 'right',
                               text = data$inderstry,
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(67, 67, 67)'),
                               showarrow = FALSE, align = 'right') 
# labeling the percentages of each bar (x_axis)
fig <- fig %>% add_annotations(xref = 'x', yref = 'inderstry',
                               x = data$X1 / 2, y = data$inderstry,
                               text = paste(data[,"X1"], '%'),
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(248, 248, 255)'),
                               showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'inderstry',
                               x = data$X1 + data$X2 / 2, y = data$inderstry,
                               text = paste(data[,"X2"], '%'),
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(248, 248, 255)'),
                               showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'inderstry',
                               x = data$X1 + data$X2 + data$X3 / 2, y = data$inderstry,
                               text = paste(data[,"X3"], '%'),
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(248, 248, 255)'),
                               showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'inderstry',
                               x = data$X1 + data$X2 + data$X3 + data$X4 / 2, y = data$inderstry,
                               text = paste(data[,"X4"], '%'),
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(248, 248, 255)'),
                               showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'inderstry',
                               x = data$X1 + data$X2 + data$X3 + data$X4 + data$X5 / 2, y = data$inderstry,
                               text = paste(data[,"X5"], '%'),
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(248, 248, 255)'),
                               showarrow = FALSE) 
fig <- fig %>% add_annotations(xref = 'x', yref = 'inderstry',
                               x = data$X1 + data$X2 + data$X3 + data$X4 + data$X5 + data$X6 / 2, y = data$inderstry,
                               text = paste(data[,"X6"], '%'),
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(248, 248, 255)'),
                               showarrow = FALSE) 

fig

# labeling the first Likert scale (on the top)
fig <- fig %>% add_annotations(xref = 'x', yref = 'paper',
                               x = c(5, 21, 41, 60,
                                     76,93 ),
                               y = 1.08,
                               text = top_labels,
                               font = list(family = 'Arial', size = 12,
                                           color = 'rgb(67, 67, 67)'),
                               showarrow = FALSE)

fig




table(engel$inderstry)
a1 <- subset(engel, inderstry==1)
table(a1$소득구간)
a3 <- subset(engel, inderstry==3)
table(a3$소득구간)
a4 <- subset(engel, inderstry==4)
table(a4$소득구간)
a5 <- subset(engel, inderstry==5)
table(a5$소득구간)
a6 <- subset(engel, inderstry==6)
table(a6$소득구간)
a7 <- subset(engel, inderstry==7)
table(a7$소득구간)
a8 <- subset(engel, inderstry==8)
table(a8$소득구간)
a9 <- subset(engel, inderstry==9)
table(a9$소득구간)
a10 <- subset(engel, inderstry==10)
table(a10$소득구간)
a11 <- subset(engel, inderstry==11)
table(a11$소득구간)
a12 <- subset(engel, inderstry==12)
table(a12$소득구간)
a13 <- subset(engel, inderstry==13)
table(a13$소득구간)
a14 <- subset(engel, inderstry==14)
table(a14$소득구간)
a15 <- subset(engel, inderstry==15)
table(a15$소득구간)
a16 <- subset(engel, inderstry==16)
table(a16$소득구간)
a17 <- subset(engel, inderstry==17)
table(a17$소득구간)
a18 <- subset(engel, inderstry==18)
table(a18$소득구간)



fig2 <- plot_ly(engel, x = ~소득구간, y = ~engel, type = 'box',
               marker = list(color = 'rgba(38, 24, 74, 0.8)',
                             line = list(color = 'rgb(248, 248, 249)', width = 1))) 
fig2 <- fig2 %>% layout(xaxis = list(title = "",
                                   showgrid = FALSE,
                                   showline = FALSE,
                                   showticklabels = FALSE,
                                   zeroline = FALSE,
                                   domain = c(0.15, 1)),
                      yaxis = list(title = "",
                                   showgrid = FALSE,
                                   showline = FALSE,
                                   showticklabels = FALSE,
                                   zeroline = FALSE),
                      barmode = 'box',
                      paper_bgcolor = 'rgb(248, 248, 255)', plot_bgcolor = 'rgb(248, 248, 255)',
                      margin = list(l = 120, r = 10, t = 140, b = 80),
                      showlegend = FALSE)

fig2

years <- read.csv('years.csv', header = TRUE)

table(years$연차구분)
a1 <- subset(years, 연차구분==1)
table(a1$소득구간)
a2 <- subset(years, 연차구분==2)
table(a2$소득구간)
a3 <- subset(years, 연차구분==3)
table(a3$소득구간)
a4 <- subset(years, 연차구분==4)
table(a4$소득구간)
a5 <- subset(years, 연차구분==5)
table(a5$소득구간)
a6 <- subset(years, 연차구분==6)
table(a6$소득구간)

# 연차 구분
years <- read.csv('years.csv', header = TRUE)

ylabel <- c('28세 이하', '29세~33세', '34세~38세', '39세~43세', '44세~48세', '49세 이상')
ynums <- c(41, 43, 47, 34, 40, 39)

fig2 <- plot_ly(data, labels = ~ylabel, values = ~ynums, type = 'pie',
               marker = list(color = 'rgba(38, 24, 74, 0.8)',
                              width = 1))
fig2


shapiro.test(years$연차구분)
chisq.test(table(years$연차구분))

chisq.test(years$연차구분, years$소득구간)

library(plotly)

years_all <- read.csv('years_meanall.csv', header = TRUE)

ay <- list(
        tickfont = list(color = "red"),
        overlaying = "y",
        side = "right",
        title = "행복지수"
)

fig3 <- plot_ly(years_all, x = ~years, y = ~engel, name = '엥겔지수', type = "bar",
               marker = list(color = 'rgb(135, 153, 236)'))
fig3 <- fig3 %>% add_trace(y = ~freetime, name = '여가지수',
                         marker = list(color = 'rgb(5, 238, 236)'))
fig3 <- fig3 %>% add_trace(years_all, x = ~years, y = ~happy, name = '행복지수', 
                         type = 'scatter', mode = 'lines', yaxis = "y2",
                         marker = list(color = 'rgb(240, 154, 110)'))
fig3 <- fig3 %>% layout(barmode = 'group',
                      xaxis = list(title = '년차',
                                   ticktext = list('1년차 이하', '1~5년차', '6~10년차', 
                                                   '11~15년차', '16~20년차', '21년차 이상'), 
                                   tickvals = list(1, 2, 3,4,5,6),
                                   tickmode = "array"),
                      yaxis = list(title = '엥겔.여가 지수'),
                      yaxis2 = ay)
fig3

library(agricolae)
#연차별_엥겔
bartlett.test(years$engel, years$연차구분, data=years)
earn.lm <- lm(engel ~ 연차구분, data=years)
oneway.test(engel ~ 연차구분, data=years, var.equal=FALSE)
model <- aov(engel ~ 연차구분, years, var.equal=FALSE)

comparison <- LSD.test(model, "연차구분", p.adj="bonferroni", group=T)
comparison

#연차별_여가
bartlett.test(years$freetime, years$연차구분, data=years)
earn.lm <- lm(freetime ~ 연차구분, data=years)
oneway.test(freetime ~ 연차구분, data=years, var.equal=FALSE)
model <- aov(freetime ~ 연차구분, years, var.equal=FALSE)

comparison <- LSD.test(model, "연차구분", p.adj="bonferroni", group=T)
comparison

#연차별_행복
bartlett.test(years$happy, years$연차구분, data=years)
earn.lm <- lm(happy ~ 연차구분, data=years)
oneway.test(happy ~ 연차구분, data=years, var.equal=FALSE)
model <- aov(happy ~ 연차구분, years, var.equal=FALSE)

comparison <- LSD.test(model, "연차구분", p.adj="bonferroni", group=T)
comparison

a <- subset(years, 연차구분==2)
b <- subset(years, 연차구분==3)

shapiro.test(a$engel)
shapiro.test(b$engel)

var.test(a$engel, b$engel)

t.test(a$engel, b$engel)


