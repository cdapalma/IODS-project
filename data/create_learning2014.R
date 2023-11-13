


# This is a code chunk in RStudio editor.
# Work with the exercise in this chunk, step-by-step. Fix the R code!

# read the data into memory
#bring full learning2014 data into R
lrn14 <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Look at the dimensions of the data
dim(lrn14)

# Look at the structure of the data
str(lrn14)

#Create an analysis dataset with the variables gender, age, attitude, deep, stra, 
#surf and points by combining questions in the learning2014 data
library(dplyr)
library(readr) 

lrn14 <- read.table("https://www.mv.helsinki.fi/home/kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
lrn14$attitude <- lrn14$Attitude / 10
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
lrn14$deep <- rowMeans(lrn14[, deep_questions])
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
lrn14$surf <- rowMeans(lrn14[, surface_questions])
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
lrn14$stra <- rowMeans(lrn14[, strategic_questions])
learning2014 <- lrn14[, c("gender","Age","attitude", "deep", "stra", "surf", "Points")]


learning2014 <- filter(learning2014, Points > 0)

dim(learning2014)
str(learning2014)


write.csv(learning2014, "output_learning2014.csv", row.names = FALSE, quote = FALSE)
output_learning2014 <- read.csv("output_learning2014.csv")
output_learning2014

str(output_learning2014)
head(output_learning2014)

