library(KoNLP)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(rvest)
library(NIADic)
library(googleVis)
library(tm)

textdata <- file("gubong.txt",encoding='UTF-8')
data <- readLines(textdata,encoding='UTF-8')

data <- data[-1:-3]

person1 <- length(data[grep("정민기",data)])
person2<- length(data[grep("지원",data)])
person3<- length(data[grep("승1",data)])
person4<- length(data[grep("섭",data)])
person5<- length(data[grep("윤원상",data)])
person6<- length(data[grep("임재우",data)])
person7<- length(data[grep("선현빈",data)])
person8<- length(data[grep("회원님",data)])
person9<- length(data[grep("성훈",data)])
person10<- length(data[grep("김민수",data)])

katalknum <- c(person1,person2,person3,person4,person5,person6,person7,person8,person9,person10)
katalkname <- c('정민기','윤지원','임승일','김인섭','윤원상','임재우','선현빈','유민우','김성훈','김민수')
katalkper <-  data.frame(katalkname,katalknum)

pie1 <- gvisPieChart(katalkper,options=list(width=800,height=600))

header <- pie1$html$header
header <- gsub("charset=utf-8","charset=euc-kr",header)
pie1$html$header <- header
plot(pie1)