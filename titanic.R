train <- read.csv("train.csv",header=T)

# Import the testing set: test
test <- read.csv("test.csv",header=T)

# Print train and test to the console
train
test

# Your train and test set are still loaded
str(train)
str(test)

# Survival rates in absolute numbers
table(train$Survived)

# Survival rates in proportions
prop.table(table(train$Survived))

# Two-way comparison: Sex and Survived
table(train$Sex,train$Survived)

# Two-way comparison: row-wise proportions
prop.table(table(train$Sex,train$Survived),margin=1)

# Your train and test set are still loaded in
str(train)
str(test)

# Create the column child, and indicate whether child or no child
train$Child <- NA
train$Child[train$Age < 18] <- 1
train$Child[train$Age >= 18] <- 0

# Two-way comparison
prop.table(table(train$Child,train$Survived),margin=1)

# Your train and test set are still loaded in
str(train)
str(test)

# Copy of test
test_one <- test

# Initialize a Survived column to 0
test_one$Survived<-0

# Set Survived to 1 if Sex equals "female"
test_one$Survived[test_one$Sex == "female"] <-1

test_two<-test_one[c(1,12)]
write.csv(test_two,"my_solution.csv",row.names = F)
