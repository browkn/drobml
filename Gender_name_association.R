#install dplyr package if you don't have it already
#install.packages("dplyr")

library(dplyr)

#Read all files
female_names <- read.table("female_names.txt")
male_names <- read.table("male_names.txt")
tweets <- read.table("myTweets.csv",sep = ",",header = TRUE)
View(tweets)
     

#Consider only first 5 characters for pattern matching
female_names <- data.frame(substr(unlist(female_names),1,5))
male_names <- data.frame(substr(unlist(male_names),1,5))

#change all names to upper case
tweets[4] <- mutate_each(tweets[4], list(toupper))
tweets[5] <- mutate_each(tweets[5], list(toupper))

male_names <- mutate_each(male_names, list(toupper))
female_names <- mutate_each(female_names, list(toupper))

#Gender predict for twitter data
result_data <- data.frame(tweets[2],tweets[3],tweets[4], tweets[5], 1:dim(tweets)[1])

View(result_data)

names(result_data) <- c("tweet_text","create_at","names", "screen_name", "Gender")

###########################################
#The working code contains a for loop that creates Result_data file.
###############################################

View(result_data)


write.csv(result_data, file="result_data.csv")

