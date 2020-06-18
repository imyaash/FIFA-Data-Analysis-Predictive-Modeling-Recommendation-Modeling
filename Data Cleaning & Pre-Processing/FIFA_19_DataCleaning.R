## Importing Dataset
player_db19 <- read.csv("D:/Amity/Capstone Project/Datasets/data.csv", stringsAsFactors = F)

## Removing unnecessary features from the dataset
player_db19 <- dplyr::select(player_db19, -c(ï..Sr.Nos., Special, LS, ST, RS, LW, LF, CF, RF, RW, RW, LAM, CAM, RAM, LM, 
                                              LCM, CM, RCM, RM, LWB, LDM, CDM, RDM, RWB, LB, LCB, CB, RCB, RB))

## Dealing NAs
player_db19$Value[is.na(player_db19$Value)] <- 0
player_db19$Wage[is.na(player_db19$Wage)] <- 0
player_db19$International.Reputation[is.na(player_db19$International.Reputation)] <- 0
player_db19$Weak.Foot[is.na(player_db19$Weak.Foot)] <- 0
player_db19$Skill.Moves[is.na(player_db19$Skill.Moves)] <- 0
player_db19$Jersey.Number[is.na(player_db19$Jersey.Number)] <- 0
player_db19$Crossing[is.na(player_db19$Crossing)] <- 0
player_db19$Finishing[is.na(player_db19$Finishing)] <- 0
player_db19$HeadingAccuracy[is.na(player_db19$HeadingAccuracy)] <- 0
player_db19$ShortPassing[is.na(player_db19$ShortPassing)] <- 0
player_db19$Volleys[is.na(player_db19$Volleys)] <- 0
player_db19$Dribbling[is.na(player_db19$Dribbling)] <- 0
player_db19$Curve[is.na(player_db19$Curve)] <- 0
player_db19$FKAccuracy[is.na(player_db19$FKAccuracy)] <- 0
player_db19$LongPassing[is.na(player_db19$LongPassing)] <- 0
player_db19$BallControl[is.na(player_db19$BallControl)] <- 0
player_db19$Acceleration[is.na(player_db19$Acceleration)] <- 0
player_db19$SprintSpeed[is.na(player_db19$SprintSpeed)] <- 0
player_db19$Agility[is.na(player_db19$Agility)] <- 0
player_db19$Reactions[is.na(player_db19$Reactions)] <- 0
player_db19$Balance[is.na(player_db19$Balance)] <- 0
player_db19$ShotPower[is.na(player_db19$ShotPower)] <- 0
player_db19$Jumping[is.na(player_db19$Jumping)] <- 0
player_db19$Stamina[is.na(player_db19$Stamina)] <- 0
player_db19$Strength[is.na(player_db19$Strength)] <- 0
player_db19$LongShots[is.na(player_db19$LongShots)] <- 0
player_db19$Aggression[is.na(player_db19$Aggression)] <- 0
player_db19$Interceptions[is.na(player_db19$Interceptions)] <- 0
player_db19$Positioning[is.na(player_db19$Positioning)] <- 0
player_db19$Vision[is.na(player_db19$Vision)] <- 0
player_db19$Penalties[is.na(player_db19$Penalties)] <- 0
player_db19$Composure[is.na(player_db19$Composure)] <- 0
player_db19$Marking[is.na(player_db19$Marking)] <- 0
player_db19$StandingTackle[is.na(player_db19$StandingTackle)] <- 0
player_db19$SlidingTackle[is.na(player_db19$SlidingTackle)] <- 0
player_db19$GKDiving[is.na(player_db19$GKDiving)] <- 0
player_db19$GKHandling[is.na(player_db19$GKHandling)] <- 0
player_db19$GKKicking[is.na(player_db19$GKKicking)] <- 0
player_db19$GKPositioning[is.na(player_db19$GKPositioning)] <- 0
player_db19$GKReflexes[is.na(player_db19$GKReflexes)] <- 0
player_db19$Release.Clause[is.na(player_db19$Release.Clause)] <- 0


## Adding date stamps to the joined and contract end date
player_db19$JoinedDate <- mdy(player_db19$Joined)
head(player_db19$JoinedDate)
player_db19$ContractEndDate  <- as.Date(player_db19$Contract.Valid.Until, format = c("%Y"))
head(player_db19$ContractEndDate)
player_db19 <- dplyr::select(player_db19, -c(Joined, Contract.Valid.Until))
player_db19$JoinedDate[is.na(player_db19$JoinedDate)] <- "2010-01-01"
player_db19$ContractEndDate[is.na(player_db19$ContractEndDate)] <- "2020-12-31"

## Removing lbs tag from weight factor
head(player_db19$Weight)
player_db19$Wght <- substr(player_db19$Weight, 1, nchar(player_db19$Weight)-3)
head(player_db19$Wght)
player_db19$Weight <- NULL
player_db19$Wght <- as.numeric(player_db19$Wght)
player_db19$Wght <- conv_unit(player_db19$Wght, "lbs", "kg")
player_db19$Wght <- set_units(player_db19$Wght, kg)
sum(is.na(player_db19$Wght))
player_db19$Wght[is.na(player_db19$Wght)] <- 0

## Exporting data to csv to visualise in tableau
write.csv(player_db19, "D:/Amity/Capstone Project/Datasets/FIFA19_Player_DB.csv")
print("File 'FIFA19_Player_DB.csv' has been exported to the dataset source folder for data visualization done using tableau.")

## Removing Other unnecessary variables
player_db19 <- dplyr::select(player_db19, -c(Preferred.Foot, Weak.Foot,
                                             Skill.Moves, Work.Rate, Body.Type, Real.Face, Jersey.Number,
                                             Loaned.From, Height, Release.Clause, JoinedDate, ContractEndDate,
                                             Wght))
