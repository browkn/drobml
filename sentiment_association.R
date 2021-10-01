
     library(tm)
     library(dplyr)
     library(SnowballC)
     library(syuzhet)
     library(scales)
     library(stringr)
     
     result_data<- read.table("result_data.csv",sep = ",",header = TRUE)
     test<-result_data 
     names(test) <- c("d","tweet_text","created_at", "screen_name","names", "Gender")
     test<-dplyr::filter(test, Gender== 2)
     ###
     newtest <-test
     as.factor(newtest$Gender)
     males.emotion.gendertopic <-newtest %>%
     mutate(Gender = replace(Gender, Gender== "2", "Male"))
     #MALES
     males.emotion.gendertopic <-newtest
     head(males.emotion.gendertopic)
     names(head(males.emotion.gendertopic))
     
     wordgender.df<-unlist(males.emotion.gendertopic[,2])
     wordgender <- as.vector(wordgender.df)
     ###MALES
     emotion.genderone <- get_nrc_sentiment(wordgender)
     ###
     men.emotion.gendertopic.tweets <- cbind(wordgender,emotion.genderone, males.emotion.gendertopic$created_at) 
     names(men.emotion.gendertopic.tweets) <- c("d","tweet_text","created_at", "screen_name","names", "Gender")
     ymale <- cbind(males.emotion.gendertopic$Gender,men.emotion.gendertopic.tweets) 
     colnames(ymale) = c("Gender","tweet_text","anger","anticipation","disgust","fear","joy","sadness","surprise","trust","negative","positive","created_at")
     View(ymale)
     #NUMERIC TO FACTOR FOR GENDER
     mm<-  ymale %>%
     mutate(Gender = replace(Gender, Gender== "2", "Male"))

     ##FEMALES
     newtest1<-result_data 
     names(newtest1) <- c("d","tweet_text","created_at", "screen_name","names", "Gender")
     newtest1<-dplyr::filter(newtest1, Gender== 1)
     as.factor(newtest1$Gender)
     head(newtest1)
     females.emotion.gendertopic <-newtest1
     wordgender.female<-unlist(females.emotion.gendertopic[,2])
     head(wordgender.female)

     female.wordgender <- as.vector(wordgender.female)
     femaleemotion.gendertwo <- get_nrc_sentiment(female.wordgender)
     #####
     xfemale <- cbind(newtest1$Gender,female.wordgender, femaleemotion.gendertwo,newtest1$created_at)
     colnames(xfemale) = c("Gender","tweet_text","anger","anticipation","disgust","fear","joy","sadness","surprise","trust","negative","positive","created_at")
     ff<-xfemale %>%
     mutate(Gender = replace(Gender, Gender== "1", "Female"))
     data_database <- rbind(xfemale, ymale)
     View(data_database)
     write.csv( data_database, file=" data_database.csv")
     
