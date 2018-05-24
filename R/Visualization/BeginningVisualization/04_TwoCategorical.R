#Bivariate Visualizations for
# two qualitiative variables

setwd("C:/Prog/CBT/ExploratoryData/m3")
movies <- read.csv("Movies.csv")
head(movies)
tail(movies)

#contingency table
awards <-  table(movies$Award, movies$Rating)

print(awards)

barplot(
  height = awards,
  beside = TRUE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  legend = c("No", "Yes"),
  args.legend = list(x = "topleft", title = "Awards")
)

# Stacked Freq Bar Chart
barplot(
  height = awards,
  beside = FALSE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  legend = c("No", "Yes"),
  args.legend = list(x = "topleft", title = "Awards")
) 

# Proportional Freq Table
proportions <-apply(awards, 2, function(x){x /sum(x)})
head(proportions)

barplot(
  height = proportions,
  #beside = TRUE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  legend = c("No", "Yes"),
  args.legend = list(x = "topleft", title = "Awards")
)

awards <-  table(movies$Rating, movies$Award)

colnames(awards) <-  c("No", "Yes")
awards

#Spineplot
spineplot(
  x = awards,
  main = "Proportion of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Awards"
)

#mosaic plot
mosaicplot(
  x = awards,
  main = "Proportion of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Awards"
)

#lattice 
library(lattice)
barchart(
  x = awards,
  stack = FALSE,
  horizontal = FALSE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  auto.key = list(x = .05, y = .95, title = "Awards", text = c("No", "Yes"))
)

#Stacked Freq Bar Chart
barchart(
  x = awards,
  stack = TRUE,
  horizontal = FALSE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  auto.key = list(x = .05, y = .95, title = "Awards", text = c("No", "Yes"))
)

matrix <- apply(awards, 1, function(x){x /sum(x)})
proportions <- t(matrix) # transpose matrix
head(awards)
head(proportions)

#100% stack freq bar chart

barchart(
  x = proportions,
  stack = TRUE,
  horizontal = FALSE,
  main = "Proportion of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Proportion of Movies",
  auto.key = list(x = .7, y = 1.05, columns = 2, title = "Awards", text = c("No", "Yes"), background="white")
)

# NOTE: No spine plot or mosaic plot in lattice
#ggplot2
library(ggplot2)
ggplot(
  data = movies,
  aes(x = Rating, fill=Award)) +
  geom_bar(position = "dodge") +
  ggtitle("Count of Movies by Rating and Awards") + 
  scale_fill_discrete(labels = c("No", "Yes"))

# Stacked Freq Bar Chart
ggplot(
  data = movies,
  aes(x = Rating, fill=Award)) +
  geom_bar() +
  ggtitle("Count of Movies by Rating and Awards") + 
  scale_fill_discrete(labels = c("No", "Yes"))

# 100% Stack Freq Bar Chart
ggplot(
  data = movies,
  aes(x = Rating, fill=Award)) +
  geom_bar(position = "fill") +
  ggtitle("Count of Movies by Rating and Awards") + 
  ylab("Proportion of Movies") + 
  scale_fill_discrete(labels = c("No", "Yes"))
# NOTE: No spine plot or mosaic plot in lattice

