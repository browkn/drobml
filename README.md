# drobml
ML Projects And Practice

Description
=================================
The goal of this research is to compare the algorithm's predictive performance over specified time-frames to its performance within different topics/ hashtags. For example, does the tweet topic provide a ( different measurable performance outcome ) when compared to the algorithm's predictive performance for a defined timespan? 

It’s risky to depend only on sentiment analysis for business decisions. However, the influence of social sentiment impacts businesses of all sizes. Social media dynamics impact customer interest and societal issues, merchandise, stock prices, and other social media markets. In this project, the Twitter gender sentiment algorithm processes and compare tweets associated with hashtags categories related to capitalism, socialism, wellness, finance, and wine, to name a few. 
The goal of the R algorithm is to predict gender sentiment. Twitter API data is collected. Each tweets.csv file consist of tweets scraped during various time-frames. It's risky to depend only on sentiment analysis for business decisions. However, the influence of social sentiment impacts businesses of all sizes. Social media dynamics impact customer interest and societal issues, merchandise, stock prices, and other social media markets. In this project, the Twitter gender sentiment algorithm processes and compare tweets associated with a range of hashtags categories. 

Tweets are pre-processed. This step normalizes, scales, and standardizes the data. Gender sentiment is essential for targeting and managing the conversations that drive online communities. The gender sentiment algorithm provides insight for building and or managing social media campaign strategies. K-fold cross-validation is used to rank models. The evaluation metric is accuracy and kappa for the Gender Prediction algorithm. In addition, the exploratory plots offer sentiment scope and important relationships between features, gender categories, and specific families of hashtags.


The tweets were captures using Twitter's API. The cleaning process is important.  The myTweets.csv is the output from the basic cleaning script. There is stil room to improve the cleaing process. Data cleaing is a time consuming process. The myTweets.csv is used to associate the twitter user identification with a male or female. The result is the result_data.csv and The sentiment association script vectorizes and assigns sentiment scores to the text. 
The Gender_name_association.csv file searches for a gender match which requires a lot of resources. The memory allocation and availibility is evident with the gender/name association script. The Gender Predictive model summary offers insight into the performance of this model. The 10-fold cross-validation script creates the output comparing the performance metric for the machine learning models. 

![feature selection](https://user-images.githubusercontent.com/5244413/138268397-7a5ac09a-f727-4c11-9a9f-baf602618aae.png)

I used a wrapper feature (greedy search algorithm) selection to create this graph. I had three options for feature selection. Over 50,000 Tweets in the file related to sustainability, climate change, renewable energy, gardening, and other green-related topics. The tweets ranged from 2017-01-01 07:58:15 to 2017-03-18 08:57:12. I screened the features to select the best for predicting gender. The features colored in green rank at the top group of performers.



The wordcloud is generated from 50000 Green related tweets.

![green world cloud](https://user-images.githubusercontent.com/5244413/138534045-1d5eb12e-2858-44c6-b278-9cdf63524c03.png)


These are basic exploratory graphs and plots. The relationship between char_count and unique_words isn't out of the ordinary. However, it's worth monitoring how tweet topic, gender ratio impacts the relationship between the two features within other datasets. 



![charcount_unique_words_green](https://user-images.githubusercontent.com/5244413/138534299-1e15db05-ba88-4c7b-b0b7-168009975bef.png)


The features highlighted in green are in the exploratory plots below.




![anticipation_green_trust](https://user-images.githubusercontent.com/5244413/138536042-848bfc05-e52b-4cef-891e-8dfe98d86873.png)

![char_count](https://user-images.githubusercontent.com/5244413/138536026-65d92684-e4fa-499d-bc7e-2678e9444f7e.png)

![num_unique_words](https://user-images.githubusercontent.com/5244413/138536064-09bd1013-f653-41d8-a7c7-753903482606.png)

![joy_word_count](https://user-images.githubusercontent.com/5244413/138536056-21c8ce03-5f8a-4b9b-aafb-616dc4fb81bc.png)

The tree diagram is produced with the tree library found in R. 

![Green Tree](https://user-images.githubusercontent.com/5244413/138540293-3da66d8b-f783-4aa1-9600-578c35f4d604.png)

