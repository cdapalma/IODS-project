#Data wrangling exercise - 'human' dataset originates from the United Nations Development Programme

library(tidyr)
library(readr)
library(dplyr)
library(ggplot2)

#Read in the “Human development” data set
hd <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/human_development.csv")

#Read the “Gender inequality” data set
gii <- read_csv("https://raw.githubusercontent.com/KimmoVehkalahti/Helsinki-Open-Data-Science/master/datasets/gender_inequality.csv", na = "..")
                
# Structureand dimensions of the dataset hg
str(hd)
dim(hd)
# Summary of the variables
summary(hd)
                
# Structure and dimensions of the dataset gii
str(gii)
dim(gii)
# Summary of the variables
summary(gii)

# Rename variables in the human development dataset (hd)
hd <- hd %>%
  rename(
    HDI.Rank = `HDI Rank`, 
    Country = `Country`, 
    HDI = `Human Development Index (HDI)`,
    Life.Exp = `Life Expectancy at Birth`,
    Edu.Mean = `Mean Years of Education`,
    Edu.Exp = `Expected Years of Education`,
    GNI = `Gross National Income (GNI) per Capita`,
    GNI.Minus.Rank = `GNI per Capita Rank Minus HDI Rank`
  )

# Rename variables in the gender inequality dataset (gii)
gii <- gii %>%
  rename(
    GII.Rank = `GII Rank`,
    Country = `Country`,
    GII = `Gender Inequality Index (GII)`,
    Mat.Mor = `Maternal Mortality Ratio`, 
    Ado.Birth = `Adolescent Birth Rate`, 
    Parli.F = `Percent Representation in Parliament`, 
    Edu2.F = `Population with Secondary Education (Female)`,
    Edu2.M = `Population with Secondary Education (Male)`, 
    Labo.F = `Labour Force Participation Rate (Female)`, 
    Labo.M = `Labour Force Participation Rate (Male)` 
  )

str(hd)
dim(hd)
str(gii)
dim(gii)

#Point number 5 of exercise

gii <- gii %>%
  mutate(
    Edu2.FM = Edu2.F / Edu2.M,
    Labo.FM = Labo.F / Labo.M
  )


str(gii)
dim(gii)

#Point numer 6 of exercise

human <- inner_join(hd, gii, by = "Country")

str(human)
dim(human)
# Save the joined data to a CSV file

write_csv(human, "data/human.csv")
