library(KoNLP)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(rvest)
library(NIADic)
library(googleVis)
library(tm)

#text file read
textdata <- file("test.txt",encoding='UTF-8')
data <- readLines(textdata,encoding='UTF-8')

#불필요한 앞부분 제거 head text(which is not useful) delete
data <- data[-1:-3]

#각 유저 빈도수 조회 search users' frequency
person1 <- length(data[grep("\\[프로간잽이",data)])
person2<- length(data[grep("\\[쿠팡알바",data)])
person3<- length(data[grep("\\[나츠키세나",data)])
person4<- length(data[grep("\\[맥도날드알바",data)])
person5<- length(data[grep("\\[모스버거알바",data)])
person6<- length(data[grep("\\[백곰",data)])
person7<- length(data[grep("\\[세븐일레븐알바",data)])
person8<- length(data[grep("\\[셱셱버거알바",data)])
person9<- length(data[grep("\\[쏘쌔드",data)])
person10<- length(data[grep("\\[아비꼬카레",data)])
person11<- length(data[grep("\\[쵸비",data)])
person12<- length(data[grep("\\[토치기알바",data)])
person13<- length(data[grep("\\[GS25",data)])
person14<- length(data[grep("\\[JP야마자키빵공장",data)])
person15<- length(data[grep("\\[ときわ",data)])
person16<- length(data[grep("\\[로손알바",data)])

#x,y축데이터 생성 create x,y axis data
katalknum <- c(person1,person2,person3,person4,person5,person6,person7,person8,person9,person10,person11,person12,person13,person14,person15,person16)
katalkname <- c('프로간잽이','쿠팡알바','나츠키세나','맥도날드알바','모스버거알바','백곰','세븐일레븐알바','셱셱버거알바','쏘쌔드','아비꼬카레','쵸비','토치기알바','GS25','JP야마자키빵공장','ときわ','로손알바')
katalkper <-  data.frame(katalkname,katalknum)

#차트 생성 create chart
pie1 <- gvisPieChart(katalkper,options=list(width=800,height=600))

#한글 깨짐 방지 prevent Korean broken
header <- pie1$html$header
header <- gsub("charset=utf-8","charset=euc-kr",header)
pie1$html$header <- header
plot(pie1)