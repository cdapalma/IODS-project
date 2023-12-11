# Task 1: Load, inspect, and summarize BPRS data

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep = " ", header = TRUE)
str(BPRS)
summary(BPRS)

# Task 2: Convert categorical variables to factors in BPRS
BPRS$subject <- factor(BPRS$subject)
BPRS$treatment <- factor(BPRS$treatment)

# Task 3: 
# Convert to long form
BPRSL <-  pivot_longer(BPRS, cols = -c(treatment, subject),
                       names_to = "weeks", values_to = "bprs") %>% arrange(weeks) #order by weeks variable

# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
rm(BPRS)

glimpse(BPRSL)

# View and summarize the long form data
str(BPRSL)
summary(BPRSL)
write.csv(BPRSL, "data/BPRS_long.csv", row.names = FALSE)


# Task 4: Load, inspect, and summarize RATS data
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')
str(RATS)
summary(RATS)


# Convert categorical variables to factors in RATS
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Convert RATS to long form and add a Time variable
RATSL <- pivot_longer(RATS, cols=-c(ID,Group), names_to = "WD",values_to = "Weight")  %>%
  mutate(Time = as.integer(substr(WD,3,4))) %>% arrange(Time)

glimpse(RATSL)
# View and summarize the long form data
str(RATSL)
summary(RATSL)
write.csv(RATSL, "data/RATS_long.csv", row.names = FALSE)


