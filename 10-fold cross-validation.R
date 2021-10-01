
# load the CSV file from the local directory
dataset <- read.csv(traindup.csv, header=FALSE)
# set the column names in the dataset
colnames(dataset) <- c("Gender","anger","anticipation","disgust", "fear","joy","sadness","surprise","trust","negative","positive" , "word_count","char_count","num_unique_words")


# create a list of 80% of the rows in the original dataset we can use for training
validationIndex <- createDataPartition(dataset$Gender, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- dataset[-validationIndex,]
# use the remaining 80% of data to training and testing the models
dataset <- dataset[validationIndex,]

# summarize the class distribution
percentage <- prop.table(table(dataset$Gender)) * 100
cbind(freq=table(dataset$Gender), percentage=percentage) 

# Run algorithms using 10-fold cross-validation
trainControl <- trainControl(method="cv", number=10)metric <- "Accuracy"   


# LDA
set.seed(7)
fit.lda <- train(Gender~., data=dataset, method="lda", metric=metric,
                 trControl=trainControl)
# CART
set.seed(7)
fit.cart <- train(Gender~., data=dataset, method="rpart", metric=metric,
                  trControl=trainControl)
# KNN
set.seed(7)
fit.knn <- train(Gender~., data=dataset, method="knn", metric=metric,
                 trControl=trainControl)
# SVM
set.seed(7)
fit.svm <- train(Gender~., data=dataset, method="svmRadial", metric=metric,
                 trControl=trainControl)
# Random Forest
set.seed(7)
fit.rf <- train(Gender~., data=dataset, method="rf", metric=metric, trControl=trainControl)


# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

# Best Model
print(fit.lda) 

# LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Gender)