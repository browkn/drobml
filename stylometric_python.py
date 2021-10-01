##################
      Python Script
##################


   import pandas as pd
   from pandas import DataFrame
   train_dirt = pd.read_csv('newdatabasetweets.csv', sep=',', error_bad_lines=False, encoding="latin-1")


   train_dirt .describe()
   exploratory_mean_before = train_dirt .describe()


#One of the most basic features we can extract is the number of words in each tweet. 
   train_dirt['word_count'] = train_dirt['tweet_texttwo'].apply(lambda x: len(str(x).split(" ")))
   train[['tweet_text','word_count']].head()


#Number of characters
   train_dirt['char_count'] = train_dirt['tweet_texttwo'].str.len() ## this also includes spaces


   train['num_unique_words'] = train['tweet_text'].apply(lambda x: len(set(w for w in x.split())))

   traindup = DataFrame(train_dirt, columns = ["Gender","anger","anticipation","disgust", "fear","joy","sadness","surprise","trust","negative","positive", "word_count","char_count","num_unique_words"])

   export_csv =traindup .to_csv (' traindup.csv', index = None, header=True)

