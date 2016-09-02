# Loading the necessary library

library(readr)
library(randomForest)
library(stringr)
library(dplyr)

# Read competition data files:
train <- read_csv("../input/train.csv")
test <- read_csv("../input/test.csv")
result<-read_csv("../input/sample_submission.csv")

# Knowing the rows in both the datasets
cat(sprintf("Training set has %d rows and %d columns\n", nrow(train), ncol(train)))
cat(sprintf("Test set has %d rows and %d columns\n", nrow(test), ncol(test)))

set.seed(80)

# Saving the column names of sample into a variable for further use
sub <- names(result)[2:100]

# Creating a loop for every specie in the sample submission
for (i in sub) {
  # Detecting the pattern using the str_detect method
  train$pattern <- str_detect(train$species, i)
  # Building the model using randomForest method on the detected pattern
  model <- randomForest(as.factor(pattern) ~ .,train %>% select(-species),ntree=295)
  # Predicting the values of the test dataset using the final pattern detected
  prediction <- predict(model, test,type="prob")
  # Saving resulted predictions into a variable to be written in the next step
  result[, eval(i)] <- prediction[,2]
}

# Saving the prepared result in a file
write.csv(result,"result.csv",row.names=F)
cat("written file")