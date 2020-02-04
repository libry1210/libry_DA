news <- read.csv('News-article-wikipedia-DFE.csv', stringsAsFactors = F)

install.packages('tm')
install.packages('slam')
install.packages('lsa')
install.packages('GPArotation')
install.packages('topicmodels')
install.packages('lda')
library(tm)

corpus <- Corpus(VectorSource(news$newdescp))
tdm <- TermDocumentMatrix(corpus, control = list(removeNumbers=T, removePunctuation=T, stopwords=T))
library(slam)

word_count <- as.array(rollup(tdm, 2))
word_order <- order(word_count, decreasing = T)
freq_word <- word_order[1:1000]

library(lsa)
library(GPArotation)

tdm_mat <- as.matrix(tdm[freq_word, ])
tdm_w <- lw_bintf(tdm_mat) * gw_idf(tdm_mat)


news_lsa <- lsa(tdm_w, 30)

news_lsa$tk[,1]

tk <- Varimax(news_lsa$tk)$loadings

for(i in 1:30){
  print(i)
  importance <- order(abs(tk[,i]), decreasing = T)
  print(tk[importance[1:10], i])
}

library(topicmodels)
library(lda)

dtm <- as.DocumentTermMatrix(tdm[freq_word,])
ldaform <- dtm2ldaformat(dtm, omit_empty = T)
result <- lda.collapsed.gibbs.sampler(documents = ldaform$documents, K=30, vocab = ldaform$vocab, num.iterations = 5000, burnin = 1000, alpha = 0.01, eta = 0.01)

attributes(result)
View(result$topics)

View(top.topic.words(result$topics))
