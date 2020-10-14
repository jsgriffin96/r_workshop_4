setwd("C:/Users/Jarrod/iCloudDrive/School/Fall 2020/AMIC/Workshops/r_workshop_4/data")
#install.packages("tidyverse")
library('tidyverse')

#convert to tibble
cars.tib <- as_tibble(mtcars)

#convert to dataframe for legacy code
mtcars.df <- as.data.frame(cars.tib)


##two main differences between tibble and data frames
#printing and subsetting
#printing
print(cars.tib)

print(cars.tib, n = 15, width = Inf)

#subsetting
#col
cars.tib[1] #returns a tibble
cars.tib[[1]] #returns a vector

#row
cars.tib[1,] #returns a tibble


###piping operator (INVESTIGATE FURTHER)
cars.tib %>%
  filter(mpg > 25) %>%
  select(5,)

#Tidy Data (presentation)
##long v wide
#wide data
wide_pop <- read_csv("https://raw.githubusercontent.com/jsgriffin96/r_workshop_4/master/data/wide-population.csv")

#convert to tidy
tidy_pop <- pivot_longer(wide_pop, c('2018','2019','2020'), names_to = 'year', values_to = 'population')

#long data
long_states <- read_csv("https://raw.githubusercontent.com/jsgriffin96/r_workshop_4/master/data/long-population.csv")

#convert to tidy
tidy_states <- pivot_wider(long_states, names_from = condition, values_from = measure)


#separating vs uniting data

state_rate <- read_csv("https://raw.githubusercontent.com/jsgriffin96/r_workshop_4/master/data/state_rate.csv")
#seperate
tidy_rate <- separate(state_rate, rate, into = c('deaths', 'population'))
#unite
untidy_rate <- unite(tidy_rate, rate, deaths, population, sep='/')


#dealing with missing data
airQ.df <- airquality
class(airQ.df)
summary(airQ.df)
colSums(is.na(airQ.df))

OzoneMean <- mean(airQ.df$Ozone, na.rm = TRUE)
airQ.df['Ozone'][is.na(airQ.df['Ozone'])] <- OzoneMean

SolarMean <- mean(airQ.df$Solar.R, na.rm = TRUE)
airQ.df['Solar.R'][is.na(airQ.df['Solar.R'])] <- SolarMean


