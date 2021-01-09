
# Load data
trainDat <- read.csv("trainDat.csv")
testDat <- read.csv("testDat.csv")

# Select variables without NA and empty fields
dat <- trainDat[, !apply(trainDat, 2, function(x) any(is.na(x) || x==""))]

# Remove seven first variables since they are not relevant for classification
dat <- dat[, -(1:7)]

# Store predictors and outout as separate matricies
predictors <- dat %>% select(-classe) %>% as.matrix()
output <- as.matrix(dat$classe)

library(parallel)
library(doParallel)
cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
registerDoParallel(cluster)

train_Control <- trainControl(method = "cv", number = 10, allowParallel = TRUE)
fit <- train(x = predictors, y = output, trControl = train_Control, method = "rf", importance = TRUE)

stopCluster(cluster)
registerDoSEQ()

# Plotting 
# Error rate vs nr of trees
plot(fit$finalModel, log="y", main="Error rate vs Nr of trees", lty=1, lwd=2)
legend("topright", colnames(fit$finalModel$err.rate), col=1:6, cex = 0.8, fill=1:6)

# Variable importance
varImpPlot(fit$finalModel, main = "Variable importance", pch = 19, color = "steelblue")

# Code to plot varImp per class in ggplot
imp <- varImp(fit)
imp <- imp$importance
imp <- imp %>% tibble::rownames_to_column(var = "predictor")
impDat <- pivot_longer(imp, c("A","B","C","D","E"))
g <- ggplot(data = impDat, aes(y = predictor, x = value, color=name))
g + geom_point()
