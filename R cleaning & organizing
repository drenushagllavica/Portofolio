                                    ### CLEANING AND ORGANISING DATA IN R                 

#First We call on the libraries we are going to use. In case we do not have a library installed, we must install it first.
library(dplyr)
library(here)
library(janitor)
library(skimr)
library(readr)
library(tidyr)

#Using the readr library to import the excel file where our data is saved
Movie <- read.xlsx(file = "C:/Users/D/Desktop/Google/Datasets examples/Movie.xlsx", sheetIndex = 1, header = TRUE)


#Attaching the dataset we are going to use.
attach(Movie)

#Using glimpse, head and col to see how our dataset looks like
glimpse(Movie)
head(Movie)
colnames(Movie)

#Selecting some columns
Movie %>%
  select(Movie_title, Genre_1, Release_Date)
#Selecting all columns, except for Release_Date
Movie %>% 
  select(-Release_Date)

#Renaming a column
Movie %>% 
  rename(date=Release_Date)          ##date is the new name of the variable Release_Date
#rename all columns in uppercase
rename_with(Movie, toupper)
#rename all columns in lowercase
rename_with(Movie, tolower)
#This ensures that there's only characters, numbers, and underscores in the names
clean_names(Movie)

#Sorting data
#Sort data in ascending order
Movie %>% arrange(Release_Date)
#Sort data in descending order
Movie %>% arrange(desc(Release_Date))  

#Creating a new dataframe
Movie2 <- Movie %>% arrange(Release_Date)

#Removing duplicate elements in the database
Movie %>% distinct(Director_1)

#Group by option 
#We summarize out data by grouping them into Genre of the movie. 
Movie %>% group_by(Genre_1) %>% summarize(mean_budget = mean(Budget))
#Finding maximum budget
Movie %>% group_by(Genre_1) %>% summarize(max_Budget = max(Budget))

#Grouping data by Genre_1 and Genre_2 based on the mean and max budget of the movie.
Movie %>% group_by(Genre_1, Genre_2) %>%  summarize (max_G1=max(Genre_1), mean_G1=mean(Budget))

#Filtering data to include only Fantasy movies
Movie %>% filter (Genre_1 == 'Fantasy')


#Separate the column Director 1(separating the name of the director into first name and last name)
director_separated <- separate(Movie, Director_1, into=c('first_name', 'last_name'), sep = ' ', remove = FALSE) 
director_separated

#Unite data from two columns into a new column
unite_genre <- Movie %>%
  select(Genre_1, Genre_2) %>% 
  unite(Genre, c("Genre_1", "Genre_2"), sep = " / ", remove=TRUE)
unite_genre

detach(Movie)
