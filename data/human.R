
#The 'human' dataset originates from the United Nations Development Programme
#Continuing with the data wrangling of create_human.R

library(readr)
library(dplyr)


human <- read.csv("data/human.csv",sep = ",", header = T)
str(human)

dim(human)

# Exclude variables, other way to do it
#human <- human[, !(colnames(human) %in% c("HDI.Rank","GNI.Minus.Rank", "HDI", "Edu.Mean", "GII.Rank", "GII", "Edu2.F", "Edu2.M", "Labo.M", "Labo.F"))]

#the way done in exercise 5

keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- select(human, one_of(keep))
str(human)
dim(human)


# Remove rows with missing values. I'll remove any row in the "human" data frame that contains at least one missing value
human <- na.omit(human)
dim(human)


print(human$Country)

#creating a vector with regions and excluding regions from our variable Country
regions <- c("World", "Arab States","East Asia and the Pacific", "Latin America and the Caribbean", "Sub-Saharan Africa","South Asia","Europe and Central Asia" )
human <- human %>% filter(!Country %in% regions)

print(human$Country)
str(human)
dim(human)

write_csv(human, "data/human2.csv")
