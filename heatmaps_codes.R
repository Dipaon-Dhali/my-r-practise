#1-heatmap
x <- mtcars
print(x)
View(x)
heatmap(x)

x <- as.matrix(mtcars)
heatmap(x, scale = "column")



#2-gplots
install.packages("gplots")
library(gplots)
heatmap.2(x, scale = "column", col = bluered(100))
?heatmap.2()


#3-p_heatmaps(prity heatmaps)

install.packages("pheatmap")
library(pheatmap)
pheatmap(x, scale = "column", cutree_rows = 4, cutree_cols = 2)


#4-ggplot2 heatmap

library(ggplot2)
y <- iris
View(iris)

View(y)
y <- y[, 1:(ncol(y) - 4)]   #this part is for removing the last 4 col from iris
View(y)

install.packages("reshape")
library(reshape)
library(dplyr)

y1 <- y %>% 
  melt()
View(y1)

ggplot(y1, aes(Species, variable, fill = value))+
  geom_tile()+
  scale_fill_gradient(low = "yellow", high = "red")
  



