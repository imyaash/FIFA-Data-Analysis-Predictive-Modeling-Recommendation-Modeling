## Multi-Linear Regression Model for Predicting Overall
lm1 <- lm(Overall ~ Age + Potential + Position + Crossing + Finishing + HeadingAccuracy + ShortPassing +
            Volleys + Dribbling + Curve + FKAccuracy + LongPassing + BallControl + Acceleration + SprintSpeed +
            Agility + Reactions + Balance + ShotPower + Jumping + Stamina + Strength + LongShots + Aggression +
            Interceptions + Positioning + Vision + Penalties + Composure + Marking + StandingTackle +
            SlidingTackle + GKDiving + GKHandling + GKKicking + GKPositioning + GKReflexes, player_db)
summary(lm1)

lm2  <- lm(Overall ~ Age + Potential + Position + Crossing + Finishing + HeadingAccuracy + ShortPassing +
             Dribbling + BallControl + Acceleration + SprintSpeed + Reactions + Balance + ShotPower + 
             Stamina + Strength + FKAccuracy + Vision + Penalties + Composure + Marking + StandingTackle +
             SlidingTackle + GKDiving + GKHandling + GKKicking + GKPositioning + GKReflexes, player_db)
save(lm2, file = "MultiLinearModelFinal.rda") #Finalizing LM2