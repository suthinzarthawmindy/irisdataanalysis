install.packages("ggplot2")
library(datasets)
library("ggplot2")
data=read.csv('/Users/mindylim/Desktop/8836201-6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv')
str(data)
head(data)
summary(data)
# Visualizations such as histograms to understand distributions and relationships between variables
hist(data$petal.length,main = "Histogram of Petal Length", xlab = "Petal Length", col = "blue")
hist(data$petal.width,main = "Histogram of Petal Width", xlab = "Petal Width", col = "red")
hist(data$sepal.length,main = "Histogram of Sepal Length", xlab = "Sepal Length", col = "green")
hist(data$sepal.width,main = "Histogram of Sepal Width", xlab = "Sepal Width", col = "yellow")

# Create a scatter plot for Sepal Length vs Sepal Width
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Scatter plot of Sepal Length vs Sepal Width",
     xlab = "Sepal Length (cm)",
     ylab = "Sepal Width (cm)",
     col = iris$Species,
     pch = 16)
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 16)

# Create a scatter plot for Petal Length vs Petal Width
plot(iris$Petal.Length, iris$Petal.Width,
     main = "Scatter plot of Petal Length vs Petal Width",
     xlab = "Petal Length (cm)",
     ylab = "Petal Width (cm)",
     col = iris$Species,
     pch = 16)
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 16)

# Create a scatter plot for Sepal Length vs Petal Length
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Scatter plot of Sepal Length vs Petal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Petal Length (cm)",
     col = iris$Species,
     pch = 16)
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 16)

# Create a scatter plot for Sepal Width vs Petal Width
plot(iris$Sepal.Width, iris$Petal.Width,
     main = "Scatter plot of Sepal Width vs Petal Width",
     xlab = "Sepal Width (cm)",
     ylab = "Petal Width (cm)",
     col = iris$Species,
     pch = 16)

# Add a legend to the plots to indicate species
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 16)


#	Use the 'ggplot2' package to visualize the differences in measurements among species.
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +geom_boxplot() +labs(title = "Comparison of Sepal Lengths", x = "Species", y = "Sepal Length")
ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +geom_boxplot() +labs(title = "Comparison of Sepal Widths", x = "Species", y = "Sepal Width")
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +geom_boxplot() +labs(title = "Comparison of Petal Lengths", x = "Species", y = "Petal Length")
ggplot(iris, aes(x = Species, y = Petal.Width, fill = Species)) +geom_boxplot() +labs(title = "Comparison of Petal Widths", x = "Species", y = "Petal Width")

