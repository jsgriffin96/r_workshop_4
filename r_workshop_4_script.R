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













