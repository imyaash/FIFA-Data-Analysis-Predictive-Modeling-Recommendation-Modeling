## regression tree model
set.seed(1)
rt <- tree(Overall ~ Age + Potential + Position + Crossing + Finishing + HeadingAccuracy + ShortPassing +
             Volleys + Dribbling + Curve + FKAccuracy + LongPassing + BallControl + Acceleration + SprintSpeed +
             Agility + Reactions + Balance + ShotPower + Jumping + Stamina + Strength + LongShots + Aggression +
             Interceptions + Positioning + Vision + Penalties + Composure + Marking + StandingTackle +
             SlidingTackle + GKDiving + GKHandling + GKKicking + GKPositioning + GKReflexes, player_db)
summary(rt)
plot(rt)
text(rt, pretty = 0)
cv.tree(rt)
rtmodel <- prune.tree(rt, best = 11)
plot(rtmodel)
text(rtmodel, pretty = 0)
save(rtmodel, file = "RegressionTree Model.rda")

## regresion tree model for predictiing value
set.seed(123)
rtvalue1 <- rpart(formula = Value ~ Overall + Age + Potential + Position + Crossing + Finishing + 
                    HeadingAccuracy + ShortPassing + Volleys + Dribbling + Curve + FKAccuracy + LongPassing + 
                    BallControl + Acceleration + SprintSpeed + Agility + Reactions + Balance + ShotPower + 
                    Jumping + Stamina + Strength + LongShots + Aggression + Interceptions + Positioning + 
                    Vision + Penalties + Composure + Marking + StandingTackle + SlidingTackle + GKDiving + 
                    GKHandling + GKKicking + GKPositioning + GKReflexes, 
                 data = player_db,
                 method = "anova",
                 control = list(cp = 0, xval = 10))
save(rtvalue1, file = "RegressionTreeValueModel1.rda")


baggedrtvalue <- bagging(formula = Value ~ Overall + Age + Potential + Position + Crossing + Finishing + 
                           HeadingAccuracy + ShortPassing + Volleys + Dribbling + Curve + FKAccuracy + LongPassing + 
                           BallControl + Acceleration + SprintSpeed + Agility + Reactions + Balance + ShotPower + 
                           Jumping + Stamina + Strength + LongShots + Aggression + Interceptions + Positioning + 
                           Vision + Penalties + Composure + Marking + StandingTackle + SlidingTackle + GKDiving + 
                           GKHandling + GKKicking + GKPositioning + GKReflexes, 
                         data = player_db,
                         coob = T)
save(baggedrtvalue, file = "RegressionTreeModelBagged.rda")

ntree <- 30:100
rmse <- vector(mode = "numeric", length = length(ntree))
for(i in seq_along(ntree)) {
  set.seed(123)
  model <- bagging(formula = Value ~ Overall + Age + Potential + Position + Crossing + Finishing + 
                     HeadingAccuracy + ShortPassing + Volleys + Dribbling + Curve + FKAccuracy + LongPassing + 
                     BallControl + Acceleration + SprintSpeed + Agility + Reactions + Balance + ShotPower + 
                     Jumping + Stamina + Strength + LongShots + Aggression + Interceptions + Positioning + 
                     Vision + Penalties + Composure + Marking + StandingTackle + SlidingTackle + GKDiving + 
                     GKHandling + GKKicking + GKPositioning + GKReflexes, 
                   data = player_db,
                   coob = T,
                   nbagg = ntree[i])
  rmse[i] <- model$err
}
save(model, file = "RegressionTreeModelBagged2.rda")

## Regresssion tree with segmented data
rtvalue_seg1 <- rpart(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                  data = segment1,
                  method = "anova",
                  control = list(cp = 0, xval = 1000))
save(rtvalue_seg1, file = "RegressionTreeValueModel_Seg1.rda")

rtvalue_seg2 <- rpart(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                      data = segment2,
                      method = "anova",
                      control = list(cp = 0, xval = 10))
save(rtvalue_seg2, file = "RegressionTreeValueModel_Seg2.rda")

rtvalue_seg3 <- rpart(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                      data = segment3,
                      method = "anova",
                      control = list(cp = 0, xval = 10))
save(rtvalue_seg3, file = "RegressionTreeValueModel_Seg3.rda")

rtvalue_seg4 <- rpart(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                      data = segment4,
                      method = "anova",
                      control = list(cp = 0, xval = 10))
save(rtvalue_seg4, file = "RegressionTreeValueModel_Seg4.rda")

ntree1 <- 100:2000
rmse1 <- vector(mode = "numeric", length = length(ntree1))
for(i in seq_along(ntree1)) {
  set.seed(1234)
  model.seg1 <- bagging(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                   data = segment1,
                   coob = T,
                   nbagg = ntree1[i])
  rmse1[i] <- model.seg1$err
}
save(model.seg1, file = "RegressionTree Bagging Seg 1.rda")

ntree2 <- 100:2000
rmse2 <- vector(mode = "numeric", length = length(ntree2))
for(i in seq_along(ntree2)) {
  set.seed(1234)
  model.seg2 <- bagging(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                   data = segment2,
                   coob = T,
                   nbagg = ntree2[i])
  rmse2[i] <- model.seg2$err
}
save(model.seg2, file = "RegressionTree Bagging Seg 2.rda")

ntree3 <- 100:2000
rmse3 <- vector(mode = "numeric", length = length(ntree3))
for(i in seq_along(ntree3)) {
  set.seed(1234)
  model.seg3 <- bagging(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                        data = segment3,
                        coob = T,
                        nbagg = ntree3[i])
  rmse3[i] <- model.seg3$err
}
save(model.seg3, file = "RegressionTree Bagging Seg 3.rda")

ntree4 <- 100:2000
rmse4 <- vector(mode = "numeric", length = length(ntree4))
for(i in seq_along(ntree4)) {
  set.seed(1234)
  model.seg4 <- bagging(formula = Value ~ Overall + Age + Potential + Position + International.Reputation, 
                        data = segment4,
                        coob = T,
                        nbagg = ntree4[i])
  rmse4[i] <- model.seg4$err
}
save(model.seg4, file = "RegressionTree Bagging Seg 4.rda")