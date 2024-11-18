##Barplot from scratch (one way anova)
library(ggplot2)
library(multcompView)
library(dplyr)

install.packages("ggthemes")
library(ggthemes)

#1-import data
data("chickwts")
View(chickwts)

#2-calculate "mean" of treatment groups & the "standard deviation" SD to show on error bar as follows:
mean_data <- group_by(chickwts, feed) %>% #feed is my treatment here
  summarise(weight_mean= mean(weight), sd = sd(weight)) %>%  #to calculate mean & SD
  arrange(desc(weight_mean))

View(mean_data)  

tibble(mean_data)

##3- this step involves performing analysis of variance "anova" using builtin  "aov()" function

library(stats)
data("chickwts")
anova <- aov(weight ~ feed, data = chickwts)
summary(anova)

##4- if the anova is significantly different them, we will draw a multiple mean comperision
tukey <- TukeyHSD(anova)
tukey

##5- Draw multiple comparison letters using "multcomp" R package as follow
group_letters <- multcompLetters4(anova, tukey)
View(group_letters) 
group_letters

## extracting group letters
group_letters <- as.data.frame.list(group_letters$feed)
group_letters

colnames(group_letters)
mean_data$group_letters <- group_letters$Letters
mean_data <- merge(mean_data, group_letters, by = "feed")




# adding to the mean data

mean_data$group_letters <- group_letters$letters
tibble(mean_data)

#Draw bar plots
p <- ggplot(mean_data, aes(x = feed, y = weight_mean))+
  geom_bar(stat = "identity", aes(fill = feed), show.legend = F, width = 0.6)








