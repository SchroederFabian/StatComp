


## INTERACTIVE PLOTTING FUNCTION

x <- rnorm(100)
y <- rexp(100)

# locator()

plot(x,y)
pts <- locator()
points(pts$x, pts$y, col="red", pch=1, cex=2)


# identify()

plot(x,y)
pts <- identify(x,y)
points(x[pts], y[pts], col="red", cex=2)

# with labels
nms <- paste0(sample(month.abb, 100, replace=TRUE), sample(c(1:30), 100, replace = TRUE))
identify(x,y, nms)


## GRAPHIC PARAMETERS

# list all graphic parameters and their default values
par()

def.par <- par(no.readonly = TRUE) # save default, for resetting...

# change graphic parameters
par(cex=2, pch=4)
plot(x,y)

par(def.par)  #- reset to default
plot(x,y)


## DEVICE DRIVERS

help(Devices)

#jpeg(file="C:/Temp/figure.jpg", width=5, height=4, bg="white")  
pdf(file="/home/Fabian2/Desktop/StatComp/figures/devices.pdf", width = 7, height = 7)

x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks = seq(-3,3,0.5), plot = FALSE)
yhist <- hist(y, breaks = seq(-3,3,0.5), plot = FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3, 3)
yrange <- c(-3, 3)
nf <- layout(matrix(c(2,0,1,3),2,2,byrow = TRUE), c(3,1), c(1,3), TRUE)
layout.show(nf)
par(mar = c(3,3,1,1))
plot(x, y, xlim = xrange, ylim = yrange, xlab = "", ylab = "")
par(mar = c(0,3,1,1))
barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0)
par(mar = c(3,0,1,1))
barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0, horiz = TRUE)

dev.off()


## ggplot2



help.search("geom_", package = "ggplot2")

help.search("scale_", package = "ggplot2")


