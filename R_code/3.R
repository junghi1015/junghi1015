getwd()
setwd("C:/rtest")

install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
library(RColorBrewer)
library(wordcloud)
useSejongDic()
hi <- file("bigdata.txt", encoding = "UTF-8")
speech <- readLines(hi)
close(hi)
head(speech, 5)
tail(speech, 5)

big <-sapply(speech, extractNoun, USE.NAMES = F)
big

head(unlist(big),30)
f <- unlist(big)

big <- Filter(function(x){nchar(x)>=3},f)
big

write(unlist(big), "bigdata_2.txt")
re <- read.table("bigdata_2.txt")
nrow(re)
textcount <- table(re)
head(sort(textcount,decreasing=T), 30)

palete <- brewer.pal(9,"Set1")
wordcloud(names(textcount), freq = textcount, scale = c(5,1), rot.per = 0.25, min.freq = 1, random.order = F, random.color = T, colors = palete)
