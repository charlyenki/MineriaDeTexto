library(devtools)
install_github("mukul13/rword2vec")
list.of.packages <- c("ggplot2", "Rcpp", "tm" , "SnowballC" , "wordcloud"  , "ggplot2", "dplyr" , "readr", "cluster" )
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(aRxiv)
library(tm)
library(SnowballC)
library(wordcloud)
library(ggplot2)
library(dplyr)
library(readr)
library(cluster)
library(rword2vec)

data1 <- arxiv_search(query = 'cat:cond-mat.mtrl-sci', limit=15000)
dat1<- data1$abstract
dat1 <- paste(dat1, collapse=" ")


nov<- gsub("[[:cntrl:]]", " ", dat1)
nov <- tolower(nov)
nov<- removeWords(nov, words = stopwords("english"))
nov <- removePunctuation(nov)
nov<- stripWhitespace(nov)

write.table(nov, file = "data4.txt", sep = " ")

library(rword2vec)

model=word2vec(train_file = "data4.txt",output_file = "Materiales_compuestos.bin",binary=1)

cana=word_analogy(file_name = "Materiales_compuestos",search_words = "hodge problem number rational",num = 30)
