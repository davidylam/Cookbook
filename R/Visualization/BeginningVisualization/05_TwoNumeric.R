#Bivariate Visualizations for
# two quantitiative variables

setwd("C:/Prog/CBT/ExploratoryData/m3")
movies <- read.csv("Movies.csv")
head(movies)
tail(movies)

#Scatter Plot
plot(
  x = movies$Runtime,
  y = movies$Box.Office,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)

model <-lm(movies$Box.Office ~ movies$Runtime)
lines(
  x = movies$Runtime,
  y = model$fitted,
  col = "red",
  lwd = 3
)

install.packages("hexbin")
library(hexbin)

hexbin <-  hexbin(
  x = movies$Runtime,
  y = movies$Box.Office,
  xbins = 30,
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)
plot (
  x = hexbin,
  main = "Runtime vs. Box Office Revenue"
)

install.packages("MASS")
library(MASS)

# 2d kernel density estimation
density2d <-  kde2d(
  x = movies$Runtime,
  y = movies$Box.Office,
  n = 50
)

contour(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)

image(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  col = topo.colors(100),
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)


persp(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density"
)

palette(topo.colors(100))

persp(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  col = cut(density2d$z, 100),
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density"
)

palette("default")

setwd("C:/Users/dlam/Documents")
timeSeries <- read.csv("Timeseries.csv")
head(timeSeries)

plot(
  x = timeSeries,
  type = "s",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)"
)


plot(
  x = timeSeries,
  type = "l",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)"
)

#lattice
library(lattice)
#scatter plot
xyplot(
  x = Box.Office ~ Runtime,
  data = movies,
  main = "Average Box Office Revenue by Year",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)
#Add a Linear regression line
xyplot(
  x = Box.Office ~ Runtime,
  type = c("p", "r"),
  data = movies,
  main = "Average Box Office Revenue by Year",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)

library(hexbin)
#hexagonal binned freq heatmap
hexbinplot(
  x = Box.Office ~ Runtime,
  data = movies,
  xbins = 30,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)

grid <- expand.grid(
  x = density2d$x,
  y = density2d$y)

grid$z <-  as.vector(density2d$z)
head(grid)

contourplot(
  x = z ~ x * y,
  data = grid,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)
# plot of density
levelplot(
  x = z ~ x * y,
  data = grid,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)

# mesh plot of density
wireframe(
  x = z ~ x * y,
  data = grid,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)"
)
#Surface plot of density
wireframe(
  x = z ~ x * y,
  data = grid,
  drape = TRUE,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density"
)

#Step Chart
xyplot(
  x = Box.Office ~ Year,
  data = timeSeries,
  type = "s",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)"
)

xyplot(
  x = Box.Office ~ Year,
  data = timeSeries,
  type = "l",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)"
)

install.packages("latticeExtra")
library(latticeExtra)

#Area Chart
xyplot(
  x = Box.Office ~ Year,
  data = timeSeries,
  panel = panel.xyarea,
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)"
)

##ggplot2
library(ggplot2)
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  geom_point() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#Add a linear regression line
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  geom_point() + 
  geom_smooth(method = "lm")
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#Freq heatmap
  
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  stat_bin2d() +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 


#hexagonal binned freq heatmap
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  stat_binhex() +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#contour plot of density
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  geom_density2d() +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#level plot of density
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  stat_density2d(aes(fill = ..level..), geom = "polygon") +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#NOTE: 3D visualizations do not exist in ggplot2

# Step Chart
ggplot(
  data = timeSeries,
  aes(x = Year, y = Box.Office)) +
  geom_step()+
  expand_limits(y = 0) +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#line chart
ggplot(
  data = timeSeries,
  aes(x = Year, y = Box.Office)) +
  geom_line()+
  expand_limits(y = 0) +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 

#area chart
ggplot(
  data = timeSeries,
  aes(x = Year, y = Box.Office)) +
  geom_area()+
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)") 
