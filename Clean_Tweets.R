#############################################
myTweets <- read.table("tweets.csv",sep = ",",header = TRUE)

library(tibble)
library(scales)
library(stringr)
library(dplyr)

####DIRTY

myTweets <-myTweets %>% 
select(tweet_text,created_at, screen_name ,name) 
head(myTweets)


library(data.table)
set.seed(8)
myTweets <- data.table(myTweets)
myTweets<-myTweets[sample(.N, 1000)]
str(myTweets)



#remove urls					
text<-gsub('http\\S+\\s*', '', myTweets$tweet_text)					
#remove numbers				
text<-gsub('[0-9]+', '', text)	

#remove symbols
gsub( "\\.|@|#|\"|\\s" , " " , text)			
gsub( "\\.|#|?|\"|\\s" , " " , text)	
unique(text)

gsub( "\\.|!|@|\"|\\s" , " " , text)
gsub( "\\.|%|%|\"|\\s" , " " , text)
head(text)
text<-gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", text)
text<- gsub("@\\w+", "", text)
text<- gsub("[[:punct:]]", "", text)
# and convert to lower case:
text = tolower(text)
text <- str_replace_all(text,'Tweet',"")
text <- str_replace_all(text,'New',"")
myTweets$tweet_text<-text


write.csv(myTweets, file="myTweets.csv")



