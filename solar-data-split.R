library(ggplot2)
library(dplyr)
glimpse(solar)


#First thing to do is take this massive .csv "solar" which was obtained from https://www.kaggle.com/datasets/mattop/daily-solar-power-generation?resource=download
#and break it up into multple .csv's by month

#look at the date column to ensure the dates are in the proper format

# Here i use the date parsing string '%m/%d/%Y' to convert it from a string to a date format
solar$date <- as.Date(solar$date, format = '%m/%d/%Y')

str(solar$date)

#create a new column that contains the combined year and month

solar$YearMonth <- format(solar$date, '%Y-%m')

head(solar)

names(solar)

solar_data_monthly <- 'monthly_solar_data'

dir.create(solar_data_monthly, showWarnings = FALSE)

monthly_split <- split(solar, solar$YearMonth)

table(solar$YearMonth, useNA='ifany')

names(monthly_split)
for (month in names(monthly_split)) {
  print(paste("Writing:", month))
  write.csv(
  monthly_split[[month]],
  file = file.path(solar_data_monthly, paste0('solar_data_', month, '.csv')),
  row.names = FALSE
  )
}
  
getwd()
  
  
list.files("monthly_exports")
  
dir.exists(solar_data_monthly)

list.files(solar_data_monthly)
  

write.csv(head(solar,10), file.path(solar_data_monthly, "test.csv"), row.names=FALSE)
list.files(solar_data_monthly)
  
  
str(monthly_split)
  
  
  
  
  