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
    HDI_rank_ = `HDI Rank`, 
    Country = `Country`, 
    HDI = `Human Development Index (HDI)`,
    life_expectancy = `Life Expectancy at Birth`,
    mean_years_of_schooling = `Mean Years of Education`,
    Exp_years_edu = `Expected Years of Education`,
    GNI_per_capita = `Gross National Income (GNI) per Capita`,
    GNI_HDI = `GNI per Capita Rank Minus HDI Rank`
  )

# Rename variables in the gender inequality dataset (gii)
gii <- gii %>%
  rename(
    GII_rank = `GII Rank`,
    Country = `Country`,
    GII = `Gender Inequality Index (GII)`,
    MMR = `Maternal Mortality Ratio`, 
    ABR = `Adolescent Birth Rate`, 
    PRP = `Percent Representation in Parliament`, 
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
    SecondaryEducation_Ratio = Edu2.F / Edu2.M,
    LaborForceParticipation_Ratio = Labo.F / Labo.M
  )


str(gii)
dim(gii)

#Point numer 6 of exercise

human <- inner_join(hd, gii, by = "Country")

str(human)
dim(human)
# Save the joined data to a CSV file

write_csv(human, "data/human.csv")
