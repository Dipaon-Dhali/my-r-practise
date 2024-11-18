#violin plot in ggplot
#geom_violin

library(ggplot2)
data("diamonds")
View(diamonds)

d_sample <- diamonds[seq(1, 53000, by= 10),]
View(d_sample)

p <- ggplot(d_sample, aes(cut, price, colour = cut))+geom_violin()

p + geom_boxplot(width= 0.1)

ggsave("violinplot.pdf")
