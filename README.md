# R Series Part 4: Data Manipulation with the Tidyverse

Jarrod Griffin, Junior Marketing Scientist at the Center for Customer Insights and Digital Marketing, explains the concepts of Data Wrangling, the Tidyverse Package, Tidy data and tibbles while also demonstrating how to convert various forms of data into tidy data. He also demonstrates the use of key Dplyr verbs as well as the piping operator.

## Learning Outcomes:

Describe the concept of data Wrangling 
Describe how tibbles are different from data frames.
Explain how to convert wide or long data to “Tidy” data
Be familiar with key dplyr verbs and use them to transform data
Zoom in on data using the piping operator
Compare subgroups with group_by in conjunction with piping and dplyr verbs

## Relevant Links:
Book: https://r4ds.had.co.nz/index.html 

wide_pop <- read_csv("https://raw.githubusercontent.com/jsgriffin96/r_workshop_4/master/data/wide-population.csv")

long_states <- read_csv("https://raw.githubusercontent.com/jsgriffin96/r_workshop_4/master/data/long-population.csv")

state_rate <- read_csv("https://raw.githubusercontent.com/jsgriffin96/r_workshop_4/master/data/state_rate.csv")

Supplementary Video on How to Link RStudio and Github: https://www.youtube.com/watch?v=ssEYd8T07y4&feature=youtu.be
