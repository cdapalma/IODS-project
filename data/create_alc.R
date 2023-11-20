#Catarina Serafim, Data wrangling of Assignment 3
#20/11/2023

library(dplyr)
library(readr)
library(ggplot2)


math <- read.table("data/student-mat.csv", sep=";", header=TRUE)
por <- read.table("data/student-por.csv", sep=";", header=TRUE)

dim(mat)
dim(mat)
str(por)
str(por)
# give the columns that vary in the two data sets
free_cols <-c("failures", "paid", "absences", "G1", "G2", "G3")

# the rest of the columns are common identifiers used for joining the data sets
join_cols <- setdiff(colnames(por), free_cols)

# join the two data sets by the selected identifiers
math_por <- inner_join(math, por, by = join_cols, suffix = c(".math", ".por"))


print(colnames(math_por))
glimpse(math_por)

dim(math_por)
str(math_por)

# print out the column names of 'math_por'
colnames(math_por)

alc <- select(math_por, all_of(join_cols))
for(col_name in free_cols) {
  two_cols <- select(math_por, starts_with(col_name))
  first_col <- select(two_cols, 1)[[1]]
  if(is.numeric(first_col)) {
    alc[col_name] <- round(rowMeans(two_cols))
  } else {
    alc[col_name] <- first_col
  }
}
glimpse(alc)


# define a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

# initialize a plot of alcohol use
g1 <- ggplot(data = alc, aes(x = alc_use, fill = sex))

# define the plot as a bar plot and draw it
g1 + geom_bar()

# define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)

glimpse(alc)
dim(alc)

str(alc)


write.csv(alc, "data/alc.csv", row.names = FALSE, quote = FALSE)

