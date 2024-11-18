data("iris")
View(iris)

#PCA = Principal componant analysis
x <- prcomp(iris[, -5], center = TRUE, scale. = TRUE)
print(x)
summary(x)


#ggplot2
iris <- cbind(iris, x$x)

library(ggplot2)
ggplot(iris, aes(PC1, PC2, col= iris$Species, fill = iris$Species))+
  stat_ellipse(geom = "polygon", col= "black", alpha= 0.5)+
  geom_point(shape= 21, col= "black")

#PCA plot
install.packages("factoextra")
install.packages("FactoMiner")
library(factoextra)
library(FactoMineR)

#PCA Table
iris.pca <- PCA(iris[,-5], graph = TRUE, scale.unit = TRUE)

#screeplot
fviz_eig(iris.pca, addlabels = TRUE, ylim= c(0,70))

#PCA plot
fviz_pca_var(iris.pca, col.var = "cos2",
             gradient.col = c("red", "orange", "green", "black"))








