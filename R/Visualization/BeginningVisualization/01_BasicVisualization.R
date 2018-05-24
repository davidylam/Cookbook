install.packages("lattice")

library(lattice)
df <- data.frame(
  Name = c("a", "b", "c"),
  Value = c(10, 11, 12)
)

dotplot(x = Value ~ Name, data = df)
dotplot(x = Name ~ Value, data = df)

dotplot (
  x = Value ~ Name,
  data = df,
  main = "Hello World",
  xlab = "Name",
  ylab = "Value"
)

barchart (
  x = Value ~ Name,
  data = df,
  col = "skyblue",
  main = "Hello World Blue Color",
  xlab = "Name",
  ylab = "Value"
)

install.packages("ggplot2")
library(ggplot2)
df <- data.frame(
  Name = c("a", "b", "c"),
  Value = c(1, 2, 3)
)

ggplot(
  data = df,
  aes(
    x = Name,
    y = Value)) + geom_point()
  
ggplot(
  data = df,
  aes(
    x = Name,
    y = Value)) + geom_point() +
    ggtitle("Hello World") +
    xlab("Name") +
    ylab("Value")

ggplot(
  data = df,
  aes(
    x = Name,
    y = Value)) +
  geom_bar(
    stat = "identity",
    fill = "skyblue") +
  ggtitle("Hello World") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("Name") +
  ylab("Value")

  
?ggplot

?ggtitle
