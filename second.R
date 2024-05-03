install.packages("caret")
install.packages("rpart")
install.packages("randomForest")

library(caret)
library(rpart)
library(randomForest)
library(datasets)

# Prepare data
data=read.csv('/Users/mindylim/Desktop/8836201-6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv')

# Splitting the dataset into training and testing sets (70/30)
set.seed(123) # Ensuring reproducibility
indexes <- createDataPartition(iris$Species, p=0.8, list=FALSE)
trainData <- iris[indexes, ]
testData <- iris[-indexes, ]
trainData
testData

# Training a decision tree model
dtModel <- rpart(Species ~ ., data=trainData, method="class")
dtModel
rpart.plot(dtModel,extra= 101)

# Predicting on the test set
dtPredictions <- predict(dtModel, testData, type="class")
dtPredictions

# Training a random forest model
rfModel <- randomForest(Species ~ ., data=trainData, importance = TRUE, ntree = 500, mtry=2)
rfModel

# Predicting on the test set
rfPredictions <- predict(rfModel, testData)
rfPredictions

# Using caret to tune the decision tree model
dtTune <- train(Species~., data=trainData, method="rpart",
                trControl=trainControl(method="cv", number=10),
                tuneLength=10,  metric = "Accuracy")
dtTune

# Using caret to tune the random forest model
rfTune <- train(Species~., data=trainData, method="rf",
                trControl=trainControl(method="cv", number=10),
                tuneLength=10)
rfTune

# Evaluate Decision Tree
dtConfMat <- confusionMatrix(dtPredictions, testData$Species)
dtConfMat

# Evaluate Random Forest
rfConfMat <- confusionMatrix(rfPredictions, testData$Species)
rfConfMat
