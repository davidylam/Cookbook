#Bivariate Visualizations for
# one categorical and one numeric variables

setwd("C:/Prog/CBT/ExploratoryData/m3")
movies <- read.csv("Movies.csv")
head(movies)
tail(movies)

average <-  tapply(
  movies$Box.Office,
  movies$Rating,
  mean
)

print (average)

barplot(
  height = average,
  main = "Average Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)

#bivariate box plot
plot(
  x = movies$Rating,
  y = movies$Box.Office,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)

#Notched box plot
plot(
  x = movies$Rating,
  y = movies$Box.Office,
  notch = TRUE,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)

#Lattice
library(lattice)
install.packages("dplyr")
library(dplyr)

average <-  movies %>%
  select(Rating, Box.Office) %>%
  group_by(Rating) %>%
  summarize(Box.Office = mean(Box.Office)) %>%
  as.data.frame()

print (average)

#Bivariate Bar Chart
barchart(
  x = Box.Office ~ Rating,
  data = average,
  main = "Average Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)

bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)
#Notched Box Plot
bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  notch = TRUE,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)
#violin plot
bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  panel = panel.violin,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)"
)

#ggplot2
library(ggplot2)

ggplot(
  data = average,
  aes(x = Rating, y = Box.Office)) +
  geom_bar(stat = "identity") +
  ggtitle("Average Box Office Revenue by Rating") +
  xlab("Ratig") +
  ylab("Box Office ($M)")

#Bivariate Box Plot
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot() +
  ggtitle("Box Office Revenue by Rating") +
  xlab("Ratig") +
  ylab("Box Office ($M)")

#Notcched Box Plot
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot(notch = TRUE) +
  ggtitle("Box Office Revenue by Rating") +
  xlab("Ratig") +
  ylab("Box Office ($M)")

#violin box plot
ggplot(
  data = movies,
  aes(x = Rating, y = Box.Office)) +
  geom_violin() + 
  ggtitle("Box Office Revenue by Rating") +
  xlab("Ratig") +
  ylab("Box Office ($M)")
