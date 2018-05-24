setwd("C:/Prog/CBT/ExploratoryData/m3")
movies <- read.csv("Movies.csv")
head(movies)
tail(movies)


plot(
  x = movies$Runtime,
  y = rep(0, nrow(movies)),
  xlab= "Distribution of Movie Runtimes",
  ylab = "",
  yaxt = "n"
)
plot(
  x = movies$Runtime,
  y = rep(0, nrow(movies)),
  xlab= "Distribution of Movie Runtimes",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0,0.1)
  )

plot(
  x = movies$Runtime,
  y = jitter(rep(0, nrow(movies))),
  main = "Distribution of Movie Runtimes",
  xlab= "Runtime (minutes)",
  ylab = "",
  yaxt = "n")

boxplot(
  x = movies$Runtime,
  horizontal = TRUE,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

hist(
  x = movies$Runtime,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

hist(
  x = movies$Runtime,
  breaks = 10,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

plot(
  x = density(movies$Runtime),
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

par(mfrow = c(4,1))
#par(mfrow = c(1,1))

plot(
  x = movies$Runtime,
  y = jitter(rep(0, nrow(movies))),
  xlim = c(0, 250),
  main = "Distribution of Movie Runtimes",
  xlab = "",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0, 0.1))

boxplot(
  x = movies$Runtime,
  ylim = c(0,250),
  horizontal = TRUE)

hist(
  x = movies$Runtime,
  xlim = c(0, 250),
  main = "",
  xlab = "",
  ylab = "",
  yaxt = "n")

plot(
  x = density(movies$Runtime),
  xlim = c(0, 250),
  main = "",
  xlab = "Runtime (minutes)",
  ylab = "",
  yaxt = "n")

par(mfrow = c(1,1))

# Lattice 
library(lattice)
stripplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)
stripplot(
  x = ~Runtime,
  data = movies,
  jitter = TRUE,
  amount = .5,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

bwplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

histogram(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

densityplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

dot <- dotplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = ""
)

print (
  x = dot,
  position = c(0,.75,1,1),
  more = TRUE)

box <- bwplot(
  x = ~Runtime,
  data = movies,
  xlab = "")

print (
  x = box,
  position = c(0, .5, 1, .75),
  more = TRUE)

hist <- histogram(
  x = ~Runtime,
  data = movies,
  xlab = "",
  ylab = "",
  scales = list(y = list(draw = FALSE)))

print (
  x = hist,
  position = c(0, .25, 1, .5),
  more = TRUE)

density <- densityplot(
  x = ~Runtime,
  data = movies,
  ylab = "",
  scales = list(y = list(draw = FALSE)))
print (
  x = density,
  position = c(0, .0, 1, .25),
  more = TRUE)

# ggplot
library(ggplot2)

ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(binwidth = 1) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(
    binwidth = 1,
    stackdir = "center") +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

ggplot(
  data = movies,
  aes(x = Runtime, y = Runtime)) +
  geom_boxplot() +
  coord_flip() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("") +
  ylab("Runtime (minutes)") +
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank())
  
ggplot(
  data = movies,
  aes(x = Runtime)) +
  geom_histogram(binwidth = 10) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

ggplot(
  data = movies,
  aes(x = Runtime)) +
  geom_density() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")


dev.off()
library(grid)

viewport <-  viewport(
  layout = grid.layout(4,1))

pushViewport(viewport)


dot <-  ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(
    binwidth = .25) +
  scale_x_continuous(
    limits = c(0, 250)) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("")

print(
  x = dot,
  vp = viewport(
    layout.pos.row = 1,
    layout.pos.col = 1))
  
box <-  ggplot(
  data = movies,
  aes(x = Runtime, y = Runtime)) +
  geom_boxplot() +
  coord_flip() +
  scale_y_continuous(limits = c(0,250)) +
  xlab("")

print(
  x = box,
  vp = viewport(
    layout.pos.row = 2,
    layout.pos.col = 1))
  
hist <-  ggplot(
  data = movies,
  aes(x = Runtime)) +
  geom_histogram(binwidth = 10) + 
  scale_x_continuous(limits = c(0,250)) +
  xlab("")
print(
  x = hist,
  vp = viewport(
    layout.pos.row = 3,
    layout.pos.col = 1))

density <-  ggplot(
  data = movies,
  aes(x = Runtime)) +
  geom_density() +
  scale_x_continuous(limits = c(0,250)) +
  xlab("Runtime (minutes)")

print(
  x = density,
  vp = viewport(
    layout.pos.row = 4,
    layout.pos.col = 1))
