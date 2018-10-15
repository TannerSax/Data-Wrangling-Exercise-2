library(dplyr)
library(tidyverse)

df <- read_csv("SpringBoard Projects/titanic_original.csv")
attach(df)

df <- df %>% mutate(embarked = ifelse(is.na(embarked), TRUE, embarked))

df <- df %>% mutate(embarked = gsub(TRUE, "S", embarked))

df %>% select(embarked) %>% unique()

mean(age, na.rm = TRUE)
# Mean = 29.8811

df <- df %>% mutate(age = ifelse(is.na(age), 29.8811, age))
df %>% tally(is.na(age))

# The missing values also could have been calculated by weighting the average based
# on the number of occurences within groups. For example, grouping ages by 0-10, 11-20, 
# 21-30, 31-40, etc. Then, the group with the highest number of occurences would be given
# the most weight to determine the mean. This would be useful if there is reason to
# believe that the missing ages are more likely to belong to a certain age group.

df <- df %>% mutate(boat = ifelse(is.na(boat), 'NA', boat))
df %>% tally(is.na(boat))

df <- df %>% mutate(has_cabin_number = ifelse(is.na(cabin), 0, 1))

write.csv(df, file = "titanic_clean")






