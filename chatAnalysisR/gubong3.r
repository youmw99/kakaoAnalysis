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

data_mod <- str_replace_all(data,"오전","") %>%
  str_replace_all("오후","") %>%
  str_replace_all("[ㄱ-ㅎ]+","") %>%
  str_replace_all("[0-9]+:[0-9]","") %>%
  str_replace_all("[0-9]+년+ [0-9]+월+ [0-9]+일","")%>%
  str_replace_all(".+:","") %>%
  str_replace_all("메시지","")%>%
  str_replace_all("(http).+(\\w)","")


noun <- sapply(data_mod,extractNoun,USE.NAMES = F) %>% unlist()
noun2 <- Filter(function(x){nchar(x)>=2},noun)

wordFreq <- table(noun2)
noundta <- sort(wordFreq,decreasing = TRUE,200)

noundta <- noundta[-1]

pal2 <- brewer.pal(8,"Dark2")
pal <- brewer.pal(12,'Set3')
pal <- pal[-c(1:2)]

png("wordcloud.png",width=1650,height=1080)
wordcloud(names(noundta),freq=noundta,min.freq = 20,random.order=T,rot.per = 0,col=pal,encoding="UTF-8")
dev.off()
