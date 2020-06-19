library(dplyr)
library(lubridate)
library(ggplot2)
library(caret)
library(tidyverse)
library(measurements)
library(units)
library(randomForest)
library(tree)
library(neuralnet)
library(pROC)
library(rpart)
library(rpart.plot)
library(ipred)
library(jtools)
library(ggstance)
library(broom.mixed)

options(scipen = 9999)

## Sourcing datasets
source("D:/Amity/Capstone Project/Data Cleaning & Pre-Processing/FIFA_19_DataCleaning.R")
source("D:/Amity/Capstone Project/Data Cleaning & Pre-Processing/FIFA_18_DataCleaning.R")
source("D:/Amity/Capstone Project/Data Cleaning & Pre-Processing/FIFA_20_DataCleaning.R")

## Merging fifa 18 & 19 data set for ml training
player_db <- rbind(player_db19, player_db18)
player_db$Position <- as.factor(player_db$Position)
player_db$Potential <- as.numeric(player_db$Potential)
player_db$Age <- as.numeric(player_db$Age)
player_db$Overall <- as.numeric(player_db$Overall)

## Loading the MultiLinear Model for predicting Overall
load(file = "D:/Amity/Capstone Project/Prediction Models/MultiLinear Model - Overall/MultiLinearModelFinal.rda")
summary(lm2)
Overall.Predicted.MLM <- predict(lm2, player_db20, probability = T)
Overall.Predicted.MLM <- round(Overall.Predicted.MLM)
effect_plot(lm2, pred = c(Age, Potential), interval = T)
RMSE(Overall.Predicted.MLM, player_db20$Overall)

## Loading the Regression Tree Model for preticting Overall
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Overall/RegressionTree Model.rda")
par(xpd = NA) # to prevent text clipping
plot(rtmodel)
text(rtmodel, digits = 3)
Overall.Predicted.RTM <- predict(rtmodel, player_db20)
Overall.Predicted.RTM <- round(Overall.Predicted.RTM)
RMSE(Overall.Predicted.RTM, player_db20$Overall)

## Loading the Neural Network for predicting Overall
load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Overall/NeuralNetworkOverall.rda")
plot(NeuralNetwork)
Overall.Predicted.ANN <- predict(NeuralNetwork, player_db20_nn)
Overall.Predicted.ANN <- (Overall.Predicted.ANN * 
                            (max(player_db$Overall) - min(player_db$Overall))) + min(player_db$Overall)
Overall.Predicted.ANN <-  round(Overall.Predicted.ANN)
RMSE(Overall.Predicted.ANN, player_db20$Overall)

## Loading the Neural Network for predicting Value of the player
load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetworkValue.rda")
plot(NeuralNetworkValue)
Value.Predicted.ANN.1 <- predict(NeuralNetworkValue, player_db20_nn)
Value.Predicted.ANN.1 <- (Value.Predicted.ANN.1 * 
                          (max(player_db$Value) - min(player_db$Value))) + min(player_db$Value)
Value.Predicted.ANN.1 <- round(Value.Predicted.ANN.1)
RMSE(Value.Predicted.ANN.1, player_db20$Value)

load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetworkValue_.rda")
plot(NeuralNetworkValue1)
Value.Predicted.ANN.2 <- predict(NeuralNetworkValue1, player_db20_nn)
Value.Predicted.ANN.2 <- (Value.Predicted.ANN.2 * 
                            (max(player_db$Value) - min(player_db$Value))) + min(player_db$Value)
Value.Predicted.ANN.2 <- round(Value.Predicted.ANN.2)
RMSE(Value.Predicted.ANN.2, player_db20$Value)

load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetwork_Value.rda")
plot(NeuralNetwork_Value)
Value.Predicted.ANN.3 <- predict(NeuralNetwork_Value, player_db20_nn)
Value.Predicted.ANN.3 <- (Value.Predicted.ANN.3 * 
                          (max(player_db$Value) - min(player_db$Value))) + min(player_db$Value)
Value.Predicted.ANN.3 <- round(Value.Predicted.ANN.3)
RMSE(Value.Predicted.ANN.3, player_db20$Value)

load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetwork_Value1.rda")
plot(NeuralNetwork_Value1)
Value.Predicted.ANN.4 <- predict(NeuralNetwork_Value1, player_db20_nn)
Value.Predicted.ANN.4 <- (Value.Predicted.ANN.4 * 
                            (max(player_db$Value) - min(player_db$Value))) + min(player_db$Value)
Value.Predicted.ANN.4 <- round(Value.Predicted.ANN.4)
RMSE(Value.Predicted.ANN.4, player_db20$Value)

## Loading the Regression Tree Model for predicting Value of the Player
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeValueModel1.rda")
rtvalmodpred1 <- predict(rtvalue1, player_db20)
rtvalmodpred1 <- round(rtvalmodpred1)
RMSE(rtvalmodpred1, player_db20$Value)
# Loading the Bagging Regression Tree Model
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeModelBagged.rda")
rtvalmodpred2 <- predict(baggedrtvalue, player_db20)
rtvalmodpred2 <- round(rtvalmodpred2)
RMSE(rtvalmodpred2, player_db20$Value)
#Loading the second Bagged Regression Tree Model
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeModelBagged2.rda")
rtvalmodpred3 <- predict(model, player_db20)
rtvalmodpred3 <- round(rtvalmodpred3)
RMSE(rtvalmodpred3, player_db20$Value)

## Segmenting data for predicting Value of the player better predictions
# Data is divided as per the overall of the players as follows
# Players with Overall above 80 <- Segment 1
# Players with Overall more than equal to 70 but less than 80 <- Segment 2
# Players with Overall more than equal to 60 but less than 70 <- Segment 3
# And everyone else <- Segment 4
# Diffrent prediction model will be created for diffrent segments of the player
write.csv(player_db, "D:/Amity/Capstone Project/Datasets/FIFA_DB.csv")
write.csv(player_db20, "D:/Amity/Capstone Project/Datasets/FIFA20_DB.csv")
segment1 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA_DB_above80.csv")
segment2 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA_DB_70-79.csv")
segment3 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA_DB_60-69.csv")
segment4 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA_DB_below59.csv")

testsegment1 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA20_DB_above80.csv")
testsegment2 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA20_DB_70-79.csv")
testsegment3 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA20_DB_60-69.csv")
testsegment4 <- read.csv("D:/Amity/Capstone Project/Datasets/FIFA20_DB_below59.csv")

## Loading Neural Networks created with segmented dataset & scaling test data
load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetwork_Value_Seg1.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetwork_Value_Seg2.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetwork_Value_Seg3.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/NeuralNetwork Model - Value/NeuralNetwork_Value_Seg4.rda")

MinOvr1 <- min(testsegment1$Overall)
MinAge1 <- min(testsegment1$Age)              
MinPot1 <- min(testsegment1$Potential)
MinVal1 <- min(testsegment1$Value)
MinInt1 <- min(testsegment1$International.Reputation)
MinOvr2 <- min(testsegment2$Overall)
MinAge2 <- min(testsegment2$Age)              
MinPot2 <- min(testsegment2$Potential)
MinVal2 <- min(testsegment2$Value)
MinInt2 <- min(testsegment2$International.Reputation)
MinOvr3 <- min(testsegment3$Overall)
MinAge3 <- min(testsegment3$Age)              
MinPot3 <- min(testsegment3$Potential)
MinVal3 <- min(testsegment3$Value)
MinInt3 <- min(testsegment3$International.Reputation)
MinOvr4 <- min(testsegment4$Overall)
MinAge4 <- min(testsegment4$Age)              
MinPot4 <- min(testsegment4$Potential)
MinVal4 <- min(testsegment4$Value)
MinInt4 <- min(testsegment4$International.Reputation)

MaxOvr1 <- max(testsegment1$Overall)
MaxAge1 <- max(testsegment1$Age)              
MaxPot1 <- max(testsegment1$Potential)
MaxVal1 <- max(testsegment1$Value)
MaxInt1 <- max(testsegment1$International.Reputation)
MaxOvr2 <- max(testsegment2$Overall)
MaxAge2 <- max(testsegment2$Age)              
MaxPot2 <- max(testsegment2$Potential)
MaxVal2 <- max(testsegment2$Value)
MaxInt2 <- max(testsegment2$International.Reputation)
MaxOvr3 <- max(testsegment3$Overall)
MaxAge3 <- max(testsegment3$Age)              
MaxPot3 <- max(testsegment3$Potential)
MaxVal3 <- max(testsegment3$Value)
MaxInt3 <- max(testsegment3$International.Reputation)
MaxOvr4 <- max(testsegment4$Overall)
MaxAge4 <- max(testsegment4$Age)              
MaxPot4 <- max(testsegment4$Potential)
MaxVal4 <- max(testsegment4$Value)
MaxInt4 <- max(testsegment4$International.Reputation)

Overall1 <- scale(testsegment1$Overall, center = MinOvr1, scale = MaxOvr1 - MinOvr1)
Age1 <- scale(testsegment1$Age, center = MinAge1, scale = MaxAge1 - MinAge1)
Potential1 <- scale(testsegment1$Potential, center = MinPot1, scale = MaxPot1 - MinPot1)
Value1 <- scale(testsegment1$Value, center = MinVal1, scale = MaxVal1 - MinVal1)
International.Reputation1 <- scale(testsegment1$International.Reputation, center = MinInt1, scale = MaxInt1 - MinInt1)
Overall2 <- scale(testsegment2$Overall, center = MinOvr2, scale = MaxOvr2 - MinOvr2)
Age2 <- scale(testsegment2$Age, center = MinAge2, scale = MaxAge2 - MinAge2)
Potential2 <- scale(testsegment2$Potential, center = MinPot2, scale = MaxPot2 - MinPot2)
Value2 <- scale(testsegment2$Value, center = MinVal2, scale = MaxVal2 - MinVal2)
International.Reputation2 <- scale(testsegment2$International.Reputation, center = MinInt2, scale = MaxInt2 - MinInt2)
Overall3 <- scale(testsegment3$Overall, center = MinOvr3, scale = MaxOvr3 - MinOvr3)
Age3 <- scale(testsegment3$Age, center = MinAge3, scale = MaxAge3 - MinAge3)
Potential3 <- scale(testsegment3$Potential, center = MinPot3, scale = MaxPot3 - MinPot3)
Value3 <- scale(testsegment3$Value, center = MinVal3, scale = MaxVal3 - MinVal3)
International.Reputation3 <- scale(testsegment3$International.Reputation, center = MinInt3, scale = MaxInt3 - MinInt3)
Overall4 <- scale(testsegment4$Overall, center = MinOvr4, scale = MaxOvr4 - MinOvr4)
Age4 <- scale(testsegment4$Age, center = MinAge4, scale = MaxAge4 - MinAge4)
Potential4 <- scale(testsegment4$Potential, center = MinPot4, scale = MaxPot4 - MinPot4)
Value4 <- scale(testsegment4$Value, center = MinVal4, scale = MaxVal4 - MinVal4)
International.Reputation4 <- scale(testsegment4$International.Reputation, center = MinInt4, scale = MaxInt4 - MinInt4)

test_seg1 <- data.frame(Value1, Overall1, Potential1, Age1, International.Reputation1)
test_seg2 <- data.frame(Value2, Overall2, Potential2, Age2, International.Reputation2)
test_seg3 <- data.frame(Value3, Overall3, Potential3, Age3, International.Reputation3)
test_seg4 <- data.frame(Value4, Overall4, Potential4, Age4, International.Reputation4)

# Getting prediction for first segment
pred.seg1 <- predict(NeuralNetwork_Value_Seg1, test_seg1)
pred.seg1 <- (pred.seg1 * 
                (max(segment1$Value) - min(segment1$Value))) + min(segment1$Value)
pred.seg1 <- round(pred.seg1)
((mean(testsegment1$Value - pred.seg1))/mean(testsegment1$Value))*100 ## % deviance in value
RMSE(pred.seg1, testsegment1$Value)

# Getting prediction for second segment
pred.seg2 <- predict(NeuralNetwork_Value_Seg2, test_seg2)
pred.seg2 <- (pred.seg2 * 
                (max(segment2$Value) - min(segment2$Value))) + min(segment2$Value)
pred.seg2 <- round(pred.seg2)
((mean(testsegment2$Value - pred.seg2))/mean(testsegment2$Value))*100 ## % deviance in value
RMSE(pred.seg2, testsegment2$Value)

# Getting prediction for third segment
pred.seg3 <- predict(NeuralNetwork_Value_Seg3, test_seg3)
pred.seg3 <- (pred.seg3 * 
                (max(segment3$Value) - min(segment3$Value))) + min(segment3$Value)
pred.seg3 <- round(pred.seg3)
((mean(testsegment3$Value - pred.seg3))/mean(testsegment3$Value))*100 ## % deviance in value
RMSE(pred.seg3, testsegment3$Value)

# Getting prediction for last segment
pred.seg4 <- predict(NeuralNetwork_Value_Seg4, test_seg4)
pred.seg4 <- (pred.seg4 * 
                (max(segment4$Value) - min(segment4$Value))) + min(segment4$Value)
pred.seg4 <- round(pred.seg4)
((mean(testsegment4$Value - pred.seg4))/mean(testsegment4$Value))*100 ## % deviance in value
RMSE(pred.seg4, testsegment4$Value)

## Regression Tree Model (Segmented Data)
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeValueModel_Seg1.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeValueModel_Seg2.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeValueModel_Seg3.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTreeValueModel_Seg4.rda")

# Prediction for first segment
pred.rt.seg1 <- predict(rtvalue_seg1, testsegment1)
((mean(testsegment1$Value - pred.rt.seg1))/mean(testsegment1$Value))*100
RMSE(pred.rt.seg1, testsegment1$Value)

# Prediction for second segment
pred.rt.seg2 <- predict(rtvalue_seg2, testsegment2)
((mean(testsegment2$Value - pred.rt.seg2))/mean(testsegment2$Value))*100
RMSE(pred.rt.seg2, testsegment2$Value)

# Prediction for third segment
pred.rt.seg3 <- predict(rtvalue_seg3, testsegment3)
((mean(testsegment3$Value - pred.rt.seg3))/mean(testsegment3$Value))*100
RMSE(pred.rt.seg3, testsegment3$Value)

# Prediction for the last segment
pred.rt.seg4 <- predict(rtvalue_seg4, testsegment4)
((mean(testsegment4$Value - pred.rt.seg4))/mean(testsegment4$Value))*100
RMSE(pred.rt.seg4, testsegment4$Value)

## Bagged Regression Tree (Segmented Data)
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTree Bagging Seg 1.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTree Bagging Seg 2.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTree Bagging Seg 3.rda")
load(file = "D:/Amity/Capstone Project/Prediction Models/RegressionTree Model - Value/RegressionTree Bagging Seg 4.rda")

# Prediction for first segment
bag.pred.rt.seg1 <- predict(model.seg1, testsegment1)
((mean(testsegment1$Value - bag.pred.rt.seg1))/mean(testsegment1$Value))*100
RMSE(bag.pred.rt.seg1, testsegment1$Value)

# Prediction for second segment
bag.pred.rt.seg2 <- predict(model.seg2, testsegment2)
((mean(testsegment2$Value - bag.pred.rt.seg2))/mean(testsegment2$Value))*100
RMSE(bag.pred.rt.seg2, testsegment2$Value)

# Prediction for third segment
bag.pred.rt.seg3 <- predict(model.seg3, testsegment3)
((mean(testsegment3$Value - bag.pred.rt.seg3))/mean(testsegment3$Value))*100
RMSE(bag.pred.rt.seg3, testsegment3$Value)

#Prediction for last segment
bag.pred.rt.seg4 <- predict(model.seg4, testsegment4)
((mean(testsegment4$Value - bag.pred.rt.seg4))/mean(testsegment4$Value))*100
RMSE(bag.pred.rt.seg4, testsegment4$Value)
