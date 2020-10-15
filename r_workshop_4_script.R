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
#separate
tidy_rate <- separate(state_rate, rate, into = c('deaths', 'population'))
#unite
untidy_rate <- unite(tidy_rate, rate, deaths, population, sep='/')


#dealing with missing data
airQ.df <- airquality
class(airQ.df)
summary(airQ.df)
colSums(is.na(airQ.df))

#mean replacement
OzoneMean <- mean(airQ.df$Ozone, na.rm = TRUE)
airQ.df['Ozone'][is.na(airQ.df['Ozone'])] <- OzoneMean

SolarMean <- mean(airQ.df$Solar.R, na.rm = TRUE)
airQ.df['Solar.R'][is.na(airQ.df['Solar.R'])] <- SolarMean

#data transformation with dplyr 
#filter rows
cars <- mtcars
v8_automatic <- filter(cars, cyl == 8, am == 0)

#arrange
arrange(cars, mpg)
arrange(cars, desc(mpg))

#select
select(cars, mpg, cyl, hp, wt)

#mutate
mutate(cars, powerToWeight = hp/wt)

#summarise

summarise(cars, avgMPG = mean(mpg)) #not that useful

by_cyl <- group_by(cars, cyl) #group by cylinders
summarise(by_cyl, avgMPG = mean(mpg)) #summarise function now gives output by cylinders

#grouped mutates and filters (combine what we did before)
#pipe
cars %>%
  select(mpg, cyl, hp, wt) %>% #select only these cols
  mutate(ptw=hp/wt) %>%       #calculate power to weight ratio
  filter(mpg>18, ptw > 50)            #filter by power to weight and mpg

#pipe example w/o pipe
narrow_cars <- select(cars, mpg, cyl, hp, wt)
narrow_cars <- mutate(narrow_cars, ptw=hp/wt)
narrow_cars <- filter(narrow_cars, mpg>18, ptw > 50)  

#relational data


#strings
first <- 'Jarrod'
last <- 'Griffin'
str_length(first)

full <- str_c(first, last, sep = ', ')

str_sub(full, start = 1, end = 6)

#factors (categorical data)
feeling <- c('Happy', 'Upset', 'Neutral')

feeling_levels <- c('Happy', 'Neutral', 'Upset') #check order here

feeling <- factor(feeling, levels = feeling_levels)  
sort(feeling)

fct_recode(feeling, "Impartial" = "Neutral")
  
#dates and times (date, time, date-time)
library(lubridate)
today()
now()
  
#from string
ymd('2020-10-15')

dmy_hm('15-10-2020 15:16') #can also provide tz param

####Converting between data types
##Good ideas
#Character to numeric
price <- "1450"
newPrice <- price + 100 #error, why?
price <- as.numeric(price)
newPrice <- price + 100

#Numeric to character
zipcode <- 90210
zipcode <- zipcode + 15 #this makes no sense, why would we do this?
zipcode <- as.character(zipcode) #storing as char prevents the above

##Bad Ideas
#decimal numeric to int
taxRate <- 0.03 # 3% tax rate
taxRate <- as.integer(taxRate) #turns to 0

#decimal numeric to character
gravity <- 9.81
gravity <- as.character(gravity)
  
  



