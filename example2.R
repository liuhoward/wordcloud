require(XML)
require(tm)
require(wordcloud)
require(RColorBrewer)

setwd("~/workspace/wordcloud/")

#tb <- read.csv("word_cloud_1.cvs")
tb <- read.table("word_cloud_1.txt", header = TRUE)
for(index in 1:4){
  j <- c(2)*index
  i <- j - 1
  m <- as.matrix(tb[,j])
  m <- m*1000000000
  rownames(m) <- tb[,i]
  v <- sort(m[,1], decreasing = TRUE)
  d <- data.frame(word = rownames(m), freq = m)
  table(d$freq)
  pal2 <- brewer.pal(8,"Dark2")
  destfile <- paste("topic-", index, ".png")
  png(destfile, width=12, height=8, units="in", res=300)
  #pdf(file = destfile, width=100,height=100)
  wordcloud(d$word, d$freq, scale=c(4,.2),min.freq=0,
            max.words=Inf, random.order=FALSE, rot.per=0, colors=pal2)
  
  dev.off()
}