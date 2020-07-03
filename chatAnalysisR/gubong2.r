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

bfnoon <- data[grep("오전",data)]
afnoon <- data[grep("오후",data)]
timefunc <- function(x){
  time1 <- x[grep("[가-힣]+ 1[[:punct:]]",x)]
  time2 <- x[grep("[가-힣]+ 2[[:punct:]]",x)]
  time3 <- x[grep("[가-힣]+ 3[[:punct:]]",x)]
  time4 <- x[grep("[가-힣]+ 4[[:punct:]]",x)]
  time5 <- x[grep("[가-힣]+ 5[[:punct:]]",x)]
  time6 <- x[grep("[가-힣]+ 6[[:punct:]]",x)]
  time7 <- x[grep("[가-힣]+ 7[[:punct:]]",x)]
  time8 <- x[grep("[가-힣]+ 8[[:punct:]]",x)]
  time9 <- x[grep("[가-힣]+ 9[[:punct:]]",x)]
  time10 <- x[grep("[가-힣]+ 10[[:punct:]]",x)]
  time11 <- x[grep("[가-힣]+ 11[[:punct:]]",x)]
  time12 <- x[grep("[가-힣]+ 12[[:punct:]]",x)]
  return(c(length(time1),length(time2),length(time3),
           length(time4),length(time5),length(time6),
           length(time7),length(time8),length(time9),
           length(time10),length(time11),length(time12)))
}

Beforenoon <- timefunc(bfnoon)
Afternoon <- timefunc(afnoon)
time <- c('1시','2시','3시','4시','5시','6시','7시','8시','9시','10시','11시','12시')

beforenoon1 <- data.frame(time,Beforenoon,Afternoon)
timechart <- gvisColumnChart(beforenoon1,options=list(height=400,weight=500))

header <- timechart$html$header
header <- gsub("charset=utf-8","charset=euc-kr",header)
timechart$html$header <- header
plot(timechart)
