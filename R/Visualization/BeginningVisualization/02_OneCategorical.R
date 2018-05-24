setwd("C:/Prog/CBT/ExploratoryData/m3")
movies <- read.csv("Movies.csv")
head(movies)
tail(movies)

plot(
  x =movies$Rating,
  main = "Count of Movies by Rating",
  xlab = "Rating",
  ylab = "Count of Movies"
)

plot(
  x = movies$Rating,
  horiz = TRUE,
  main = "Count of Movies by Rating",
  xlab = "Count of Movies",
  ylab = "Rating"
)

dotchart(
  x = table(movies$Rating),
  pch = 16,
  main = "Count of Movies by Rating",
  xlab = "Count of Movies",
  ylab = "Rating"
)

pie (
  x = table(movies$Rating),
  main = "Count of Movies by Rating"
)
pie (
  x = table(movies$Rating),
  clockwise = TRUE,
  main = "Count of Movies by Rating"
)


#Lattice
library(lattice)
table <- table(movies$Rating)
ratings <- as.data.frame(table)
names(ratings)[1] <- "Rating"
names(ratings)[2] <- "Count"
names(ratings)
ratings


barchart(
  x = Count ~ Rating,
  data = ratings,
  main = "Count of Movies by Rating",
  xlab = "Rating"
)
barchart(
  x = Rating ~ Count,
  data = ratings,
  main = "Count of Movies by Rating",
  ylab = "Rating"
  , xlab = "Count"
)
dotplot(
  x = as.numeric(Rating) ~ as.numeric(Count),
  data = ratings,
  main = "Count of Movies by Rating",
  ylab = "Rating"
  , xlab = "Count2"
)

histogram(
  x = ~Rating,
  data = movies,
  main = "Percent of Movies by Rating"
)

library(ggplot2)
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_bar(width = .2) + 
  ggtitle("Count of Movies by Rating")

ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_bar(width = .8) + 
  coord_flip() + 
  ggtitle("Count of Movies by Rating")

ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_point(stat="count", width = 1.8) + 
  coord_flip() + 
  ggtitle("Count of Movies by Rating")

ggplot(
  data = movies,
  aes(x = "", fill = Rating)) +
  geom_bar() +
  coord_polar(theta = "y") + 
  ggtitle("Count of Movies by Rating") +
  ylab("")

ggplot(
  data = movies,
  aes(x = "", fill = Award)) +
  geom_bar() +
  coord_polar(theta = "y") + 
  ggtitle("Proportion of Movies that Won Awards") +
  ylab("")

