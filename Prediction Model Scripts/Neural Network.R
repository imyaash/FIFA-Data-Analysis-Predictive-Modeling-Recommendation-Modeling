MinOvr <- min(player_db$Overall)
MinAge <- min(player_db$Age)              
MinPot <- min(player_db$Potential)
MinCro <- min(player_db$Crossing)
MinFin <- min(player_db$Finishing) 
MinHAc <- min(player_db$HeadingAccuracy)
MinSps <- min(player_db$ShortPassing)
MinDri <- min(player_db$Dribbling)
MinBCt <- min(player_db$BallControl) 
MinAcc <- min(player_db$Acceleration)
MinSSp <- min(player_db$SprintSpeed)
MinRec <- min(player_db$Reactions)
MinBal <- min(player_db$Balance) 
MinSPw <- min(player_db$ShotPower)
MinSta <- min(player_db$Stamina)
MinStr <- min(player_db$Strength)
MinFKA <- min(player_db$FKAccuracy)
MinVis <- min(player_db$Vision)
MinPen <- min(player_db$Penalties)
MinCom <- min(player_db$Composure)
MinMar <- min(player_db$Marking)
MinSTk <- min(player_db$StandingTackle) 
MinSlT <- min(player_db$SlidingTackle)
MinGKD <- min(player_db$GKDiving)
MinGKH <- min(player_db$GKHandling)
MinGKK <- min(player_db$GKKicking)
MinGKP <- min(player_db$GKPositioning)
MinGKR <- min(player_db$GKReflexes)
MinVal <- min(player_db$Value)
MinInt <- min(player_db$International.Reputation)

MaxOvr <- max(player_db$Overall)
MaxAge <- max(player_db$Age)              
MaxPot <- max(player_db$Potential)
MaxCro <- max(player_db$Crossing)
MaxFin <- max(player_db$Finishing) 
MaxHAc <- max(player_db$HeadingAccuracy)
MaxSps <- max(player_db$ShortPassing)
MaxDri <- max(player_db$Dribbling)
MaxBCt <- max(player_db$BallControl) 
MaxAcc <- max(player_db$Acceleration)
MaxSSp <- max(player_db$SprintSpeed)
MaxRec <- max(player_db$Reactions)
MaxBal <- max(player_db$Balance) 
MaxSPw <- max(player_db$ShotPower)
MaxSta <- max(player_db$Stamina)
MaxStr <- max(player_db$Strength)
MaxFKA <- max(player_db$FKAccuracy)
MaxVis <- max(player_db$Vision)
MaxPen <- max(player_db$Penalties)
MaxCom <- max(player_db$Composure)
MaxMar <- max(player_db$Marking)
MaxSTk <- max(player_db$StandingTackle) 
MaxSlT <- max(player_db$SlidingTackle)
MaxGKD <- max(player_db$GKDiving)
MaxGKH <- max(player_db$GKHandling)
MaxGKK <- max(player_db$GKKicking)
MaxGKP <- max(player_db$GKPositioning)
MaxGKR <- max(player_db$GKReflexes)
MaxVal <- max(player_db$Value)
MaxInt <- max(player_db$International.Reputation)

Overall <- scale(player_db$Overall, center = MinOvr, scale = MaxOvr - MinOvr)
Age <- scale(player_db$Age, center = MinAge, scale = MaxAge - MinAge)
Potential <- scale(player_db$Potential, center = MinPot, scale = MaxPot - MinPot)
Crossing <- scale(player_db$Crossing, center = MinCro, scale = MaxCro - MinCro)
Finishing <- scale(player_db$Finishing, center = MinFin, scale = MaxFin - MinFin)
HeadingAccuracy <- scale(player_db$HeadingAccuracy, center = MinHAc, scale = MaxHAc - MinHAc)
ShortPassing <- scale(player_db$ShortPassing, center = MinSps, scale = MaxSps - MinSps)
Dribbling <- scale(player_db$Dribbling, center = MinDri, scale = MaxDri - MinDri)
BallControl <- scale(player_db$BallControl, center = MinBCt, scale = MaxBCt - MinBCt)
Acceleration <- scale(player_db$Acceleration, center = MinAcc, scale = MaxAcc - MinAcc)
SprintSpeed <- scale(player_db$SprintSpeed, center = MinSSp, scale = MaxSSp - MinSSp)
Reaction <- scale(player_db$Reactions, center = MinRec, scale = MaxRec - MinRec)
Balance <- scale(player_db$Balance, center = MinBal, scale = MaxBal - MinBal)
ShotPower <- scale(player_db$ShotPower, center = MinSPw, scale = MaxSPw - MinSPw)
Stamina <- scale(player_db$Stamina, center = MinSta, scale = MaxSta - MinSta)
Strength <- scale(player_db$Strength, center = MinStr, scale = MaxStr - MinStr)
FKAccuracy <- scale(player_db$FKAccuracy, center = MinFKA, scale = MaxFKA - MinFKA)
Vision <- scale(player_db$Vision, center = MinVis, scale = MaxVis - MinVis)
Penalties <- scale(player_db$Penalties, center = MinPen, scale = MaxPen - MinPen)
Composure <- scale(player_db$Composure, center = MinCom, scale = MaxCom - MinCom)
Marking <- scale(player_db$Marking, center = MinMar, scale = MaxMar - MinMar)
StandingTackle <- scale(player_db$StandingTackle, center = MinSTk, scale = MaxSTk - MinSTk)
SlidingTackle <- scale(player_db$SlidingTackle, center = MinSlT, scale = MaxSlT - MinSlT)
GKDiving <- scale(player_db$GKDiving, center = MinGKD, scale = MaxGKD - MinGKD)
GKHandling <- scale(player_db$GKHandling, center = MinGKH, scale = MaxGKH - MinGKH)
GKKicking <- scale(player_db$GKKicking, center = MinGKK, scale = MaxGKK - MinGKK)
GKPositioning <- scale(player_db$GKPositioning, center = MinGKP, scale = MaxGKP - MinGKP)
GKReflexes <- scale(player_db$GKReflexes, center = MinGKR, scale = MaxGKR - MinGKR)
Value <- scale(player_db$Value, center = MinVal, scale = MaxVal - MinVal)
International.Reputation <- scale(player_db$International.Reputation, center = MinInt, scale = MaxInt - MinInt)

player_db_nn <- data.frame(Value, Overall, Age, Potential, Crossing, Finishing, HeadingAccuracy, ShortPassing,
                           Dribbling, BallControl, Acceleration, SprintSpeed, Reaction, Balance,  ShotPower,
                           Stamina, Strength, FKAccuracy, Vision, Penalties, Composure, Marking, StandingTackle, 
                           SlidingTackle, GKDiving, GKHandling, GKKicking, GKPositioning, GKReflexes)

player_db_nn_V <- data.frame(Value, Overall, Potential, Age, International.Reputation)

## ANN for predicting Overall
NeuralNetwork <- neuralnet(Overall ~ Age + Potential + Crossing + Finishing + HeadingAccuracy + ShortPassing +
                             Dribbling + BallControl + Acceleration + SprintSpeed + Reaction + Balance +  
                             ShotPower + Stamina + Strength + FKAccuracy + Vision + Penalties + Composure + Marking + 
                             StandingTackle + SlidingTackle + GKDiving + GKHandling + GKKicking + GKPositioning + 
                             GKReflexes, 
                           data = player_db_nn, 
                           hidden = 5, 
                           linear.output = TRUE, 
                           rep = 2, 
                           stepmax = 1e+08, 
                           threshold = .1)
save(NeuralNetwork, file = "NeuralNetworkOverall.rda")

## ANN for predicting Value of player
NeuralNetworkValue <- neuralnet(Value ~ Overall + Age + Potential,
                                 data = player_db_nn_V, hidden = 2,
                                 linear.output = T, 
                                 rep = 2, 
                                 stepmax = 1e+08,
                                 threshold = .1)
save(NeuralNetworkValue)

NeuralNetwork_Value <- neuralnet(Value ~ Overall + Age + Potential + International.Reputation, 
                                  data = player_db_nn_V, hidden = 2, linear.output = TRUE, rep = 2, 
                                  stepmax = 1e+08, threshold = .1)
save(NeuralNetwork_Value, file = "NeuralNetwork_Value.rda")

NeuralNetwork_Value1 <- neuralnet(Value ~ Overall + Age + Potential + International.Reputation, 
                                data = player_db_nn_V, hidden = c(2,2), linear.output = TRUE, rep = 2, 
                                stepmax = 1e+08, threshold = .1)
save(NeuralNetwork_Value1, file = "NeuralNetwork_Value1.rda")

## ANN for predicting Value of the player with dataset divided in segments for better predictions
# Data is divided as per the overall of the players as follows
# Players with Overall above 80 <- Segment 1
# Players with Overall more than equal to 70 but less than 80 <- Segment 2
# Players with Overall more than equal to 60 but less than 70 <- Segment 3
# And everyone else <- Segment 4
# Diffrent prediction model will be created for diffrent segments of the player
MinOvr1 <- min(segment1$Overall)
MinAge1 <- min(segment1$Age)              
MinPot1 <- min(segment1$Potential)
MinVal1 <- min(segment1$Value)
MinInt1 <- min(segment1$International.Reputation)
MinOvr2 <- min(segment2$Overall)
MinAge2 <- min(segment2$Age)              
MinPot2 <- min(segment2$Potential)
MinVal2 <- min(segment2$Value)
MinInt2 <- min(segment2$International.Reputation)
MinOvr3 <- min(segment3$Overall)
MinAge3 <- min(segment3$Age)              
MinPot3 <- min(segment3$Potential)
MinVal3 <- min(segment3$Value)
MinInt3 <- min(segment3$International.Reputation)
MinOvr4 <- min(segment4$Overall)
MinAge4 <- min(segment4$Age)              
MinPot4 <- min(segment4$Potential)
MinVal4 <- min(segment4$Value)
MinInt4 <- min(segment4$International.Reputation)

MaxOvr1 <- max(segment1$Overall)
MaxAge1 <- max(segment1$Age)              
MaxPot1 <- max(segment1$Potential)
MaxVal1 <- max(segment1$Value)
MaxInt1 <- max(segment1$International.Reputation)
MaxOvr2 <- max(segment2$Overall)
MaxAge2 <- max(segment2$Age)              
MaxPot2 <- max(segment2$Potential)
MaxVal2 <- max(segment2$Value)
MaxInt2 <- max(segment2$International.Reputation)
MaxOvr3 <- max(segment3$Overall)
MaxAge3 <- max(segment3$Age)              
MaxPot3 <- max(segment3$Potential)
MaxVal3 <- max(segment3$Value)
MaxInt3 <- max(segment3$International.Reputation)
MaxOvr4 <- max(segment4$Overall)
MaxAge4 <- max(segment4$Age)              
MaxPot4 <- max(segment4$Potential)
MaxVal4 <- max(segment4$Value)
MaxInt4 <- max(segment4$International.Reputation)

Overall1 <- scale(segment1$Overall, center = MinOvr1, scale = MaxOvr1 - MinOvr1)
Age1 <- scale(segment1$Age, center = MinAge1, scale = MaxAge1 - MinAge1)
Potential1 <- scale(segment1$Potential, center = MinPot1, scale = MaxPot1 - MinPot1)
Value1 <- scale(segment1$Value, center = MinVal1, scale = MaxVal1 - MinVal1)
International.Reputation1 <- scale(segment1$International.Reputation, center = MinInt1, scale = MaxInt1 - MinInt1)
Overall2 <- scale(segment2$Overall, center = MinOvr2, scale = MaxOvr2 - MinOvr2)
Age2 <- scale(segment2$Age, center = MinAge2, scale = MaxAge2 - MinAge2)
Potential2 <- scale(segment2$Potential, center = MinPot2, scale = MaxPot2 - MinPot2)
Value2 <- scale(segment2$Value, center = MinVal2, scale = MaxVal2 - MinVal2)
International.Reputation2 <- scale(segment2$International.Reputation, center = MinInt2, scale = MaxInt2 - MinInt2)
Overall3 <- scale(segment3$Overall, center = MinOvr3, scale = MaxOvr3 - MinOvr3)
Age3 <- scale(segment3$Age, center = MinAge3, scale = MaxAge3 - MinAge3)
Potential3 <- scale(segment3$Potential, center = MinPot3, scale = MaxPot3 - MinPot3)
Value3 <- scale(segment3$Value, center = MinVal3, scale = MaxVal3 - MinVal3)
International.Reputation3 <- scale(segment3$International.Reputation, center = MinInt3, scale = MaxInt3 - MinInt3)
Overall4 <- scale(segment4$Overall, center = MinOvr4, scale = MaxOvr4 - MinOvr4)
Age4 <- scale(segment4$Age, center = MinAge4, scale = MaxAge4 - MinAge4)
Potential4 <- scale(segment4$Potential, center = MinPot4, scale = MaxPot4 - MinPot4)
Value4 <- scale(segment4$Value, center = MinVal4, scale = MaxVal4 - MinVal4)
International.Reputation4 <- scale(segment4$International.Reputation, center = MinInt4, scale = MaxInt4 - MinInt4)

player_db_seg1 <- data.frame(Value1, Overall1, Potential1, Age1, International.Reputation1)
player_db_seg2 <- data.frame(Value2, Overall2, Potential2, Age2, International.Reputation2)
player_db_seg3 <- data.frame(Value3, Overall3, Potential3, Age3, International.Reputation3)
player_db_seg4 <- data.frame(Value4, Overall4, Potential4, Age4, International.Reputation4)

NeuralNetwork_Value_Seg1 <- neuralnet(Value1 ~ Overall1 + Age1 + Potential1 + International.Reputation1,
                                      data = player_db_seg1,
                                      hidden = 3,
                                      linear.output = T,
                                      rep = 2,
                                      stepmax = 1e+08, 
                                      threshold = .1)
save(NeuralNetwork_Value_Seg1, file = "NeuralNetwork_Value_Seg1.rda")

NeuralNetwork_Value_Seg2 <- neuralnet(Value2 ~ Overall2 + Age2 + Potential2 + International.Reputation2,
                                      data = player_db_seg2,
                                      hidden = 3,
                                      linear.output = T,
                                      rep = 2,
                                      stepmax = 1e+08,
                                      threshold = .1)
save(NeuralNetwork_Value_Seg2, file = "NeuralNetwork_Value_Seg2.rda")

NeuralNetwork_Value_Seg3 <- neuralnet(Value3 ~ Overall3 + Age3 + Potential3 + International.Reputation3,
                                      data = player_db_seg3,
                                      hidden = 3,
                                      linear.output = T,
                                      rep = 2,
                                      stepmax = 1e+08,
                                      threshold = .1)
save(NeuralNetwork_Value_Seg3, file = "NeuralNetwork_Value_Seg3.rda")

NeuralNetwork_Value_Seg4 <- neuralnet(Value4 ~ Overall4 + Age4 + Potential4 + International.Reputation4,
                                      data = player_db_seg4,
                                      hidden = 3,
                                      linear.output = T,
                                      rep = 2,
                                      stepmax = 1e+08,
                                      threshold = .1)
save(NeuralNetwork_Value_Seg4, file = "NeuralNetwork_Value_Seg4.rda")