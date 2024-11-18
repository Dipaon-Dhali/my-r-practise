#scatter plots in R

library(ggplot2)
data(cars)
View(cars)

ggplot(cars, aes(speed, dist))+ geom_point()+
geom_smooth(method = "lm", se= T, level= 0.95)
#se= standard error

#scatter plot with multi line
data("Orange")
View(Orange)
ggplot(Orange, aes(age, circumference, colour = Tree))+
  geom_point(size= 3, shape= 19)

#separated by shape
data("Orange")
View(Orange)
ggplot(Orange, aes(age, circumference, colour = Tree))+
  geom_point(size= 4, shape= 19)+
  geom_line(aes(linetype= Tree), size= 1)+
  labs(
    x= "age",
    y="circumference",
    title = "Scatterplot on Orange"
  )
ggsave("scatterplot.pdf")


#bubble plot

install.packages("viridis")
library(virids)

data("quakes")
View(quakes)
nrow(quakes)
q_sample <- quakes[seq(from= 1, to= 1000, by= 10),]
View(q_sample)
nrow(q_sample)

ggplot(data = q_sample, aes(x= lat, y= long))+
  geom_point(aes(size= mag, colour = mag))+
  scale_colour_viridis(option = "B")+
  scale_size_continuous(range = c(1,9))+
  labs(
    x= "latitude",
       y= "longitude",
       title= "quakes bubbleplot")
ggsave("bubbleplot.pdf")


#jitter plot
data("diamonds")
View(diamonds)
d_sample <- diamonds[seq(1, 53000, by= 10),]
View(d_sample)
nrow(d_sample)

ggplot(d_sample, aes(cut, price, colour = cut))+
  geom_jitter()+
  labs(x="cut", y= "price", title = "diamond jitterplot")
ggsave("jitterplot.pdf")
