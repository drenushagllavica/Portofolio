### Graphs in R
# I am using a dataset that I found on Kaggle, it contains suicide rates for several countries from 1985 - 2016.

library(ggplot2)
library(dplyr)
suicides <- data.frame(suicide_rates)
View(suicides)


# We use View, colnames and nrow to see how our dataset looks like. 
# In this dataset we have 27820 rows and 11 columns.
colnames(suicides)
nrow(suicides)

# Basic plot using ggplot2 package. The '+' lets you add layers to the plot. geom_point means we are asking for a scaterplot.
suicides %>% 
  ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita, color = sex)) 

# Same graph as before, I included coord_flip to change the places of x and y axis.
suicides %>% 
  ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita, color = sex)) +
  coord_flip()

# Same graph, I used alpha = field --> this makes the graph in black&white with different visibility for both sexes
suicides %>% 
  ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita, alpha = sex)) 

# Same graph, we want the observations to be shown in purple.
suicides %>% 
  ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita), color = "purple") 

# Same graph, we want the geom_smooth option instead geom_point.
suicides %>% 
  ggplot() + 
  geom_smooth(mapping = aes(x = suicides_no, y = gdp_per_capita))

# Same graph, I wanted two different lines to see the difference between different diamond colors.
suicides %>% 
  ggplot() + 
  geom_smooth(mapping = aes(x = suicides_no, y = gdp_per_capita, linetype = sex))

# Same graph, I used the geom_smooth and geom_point.
suicides %>% 
  ggplot() + 
  geom_smooth(mapping = aes(x = suicides_no, y = gdp_per_capita)) +
  geom_point(aes(x = suicides_no, y = gdp_per_capita), 
             color = "darkgreen", size = 3, alpha = 0.3) 
  
# Same graph, I wanted to see different graphs for different colors, to do this I used the facet_wrap option.
suicides %>% 
  ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita, color = sex)) +
  facet_wrap(~age)

# Same graph, I used facet_grid to see the graphs separately based on age & sex
suicides %>% 
  ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita, color = sex)) +
  facet_grid(sex~age)

# Adding annotation to the plot
suicides %>% 
ggplot() + 
  geom_point(mapping = aes(x = suicides_no, y = gdp_per_capita, color = sex)) +
  labs(title="Suicide Rates", subtitle="1985 - 2016", 
       caption="The dataset was taken from Kaggle") +
  annotate("text", x=10000, y=100000, label="Suicide number is higher among men", color="black", 
           fontface = "bold", size = 4, angle=0)

# Showing results via a graph bar
suicides %>% 
  group_by(age, sex) %>% 
  summarize(m = mean(suicides_no)) %>% 
  ggplot(aes(x = age, y = m, group = sex, fill = sex)) +
  geom_bar(stat = "identity") 

 # Showing suicide number, based on the age of the individuals, via a histogram
suicides %>% 
  ggplot(aes(x = suicides_no, group = age, fill = age)) +
  geom_histogram(binwidth = 200) 

# Using a box plot
suicides %>% 
  group_by(age) %>% 
  ggplot(aes(x = suicides_no, y = gdp_per_capita, group = age, fill = age)) +
  geom_boxplot()

# Violin plot
suicides %>% 
  group_by(suicides_no, age) %>% 
  ggplot(aes(x = suicides_no, y = gdp_per_capita, group = age, fill = age)) +
  geom_violin()

