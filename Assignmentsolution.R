library(dplyr)
library(tidyverse)
library(ggplot2)
bikerental <- read.csv('D:/Users/HP/Desktop/RFolder/train.csv')
bikerental$datetime <- as.Date(bikerental$datetime)
class(bikerental$datetime)
View(bikerental)


#1) 
#Graph one
#To observe how is the renting trend over time

NTable <- bikerental %>%  group_by(datetime) %>%summarise(sum(count))
colnames(NTable)[2] <- "count"

NTable %>%  ggplot(aes(x=datetime,y=count)) + geom_line() +
  labs(
    x='date',
    title = 'Trend Of Renting over the years'
    
  )
#observation
#The graph shows a uptrend


#2)
#Season where the most bikes are rented
seasonTB <- bikerental %>%group_by(season) %>%  summarise(count=sum(count)) 
seasonTB %>%  ggplot(aes(x=season,y=count)) + geom_bar(stat="identity")
 
#observation
# Fall is the most favrable season for renting bike

#3)
# find which days are bikes rented more workdays or holidays 
tb <- bikerental %>%group_by(holiday) %>%  summarise(count=sum(count)) 
tb %>%  ggplot(aes(x=holiday,y=count)) + geom_bar(stat="identity") + labs( x = "Holidays   workdays")

#observation
#holidays      2027668
#workdays        57808


#4)
#prefered weather
tb2 <- bikerental %>%group_by(weather) %>%  summarise(count=sum(count)) 
tb2 %>%  ggplot(aes(x=weather,y=count)) + geom_bar(stat="identity")
# people prefer Clear, Few clouds, Partly cloudy or Partly cloudy weathers



#5)
#Peoples reaction to humid climate
bikerental %>%  ggplot(aes(x=humidity, y=count)) + geom_point()
#most bikes are rented in when the humidity was between 25 to 75


#6)
#find people prefer windy atmospher or not
bikerental %>%  ggplot(aes(x=windspeed, y=count)) + geom_point()
#as soon as windspeed crosses 20 bikers start to lose intrest

#7)
#in want temperature do people want to rent bikes 
bikerental %>%  ggplot(aes(x=temp, y=count)) + geom_point()
# between 20 to 30 people find its the optimal temperature for going out on bike rides 


