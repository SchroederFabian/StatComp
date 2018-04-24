
library(beeswarm)
df <- data.frame("x"=c(rnorm(50, mean=1), rnorm(50)), "y"=c(rep("A", 50), rep("B", 50)))

boxplot(x~y, data = df, axes = FALSE,
        xlab = "Groups", ylab = "Values", main = "Boxplots", sub = "Subtitle")                                                                
beeswarm(x~y, data = df, add = TRUE, col = "grey")                                                                
axis(side=1, at = c(1,2), labels = c("A", "B"))
axis(side=2, at = c(-1,0,1,2), labels = c("-1.0", "0.0", "1.0", "2.0"), las = 2)


df <- data.frame(rbind(MASS::mvrnorm(100, mu = c(1,0), Sigma = matrix(c(1,0.7,0.7,1), ncol=2)),
                   MASS::mvrnorm(100, mu = c(-1,1), Sigma = matrix(c(1,0.0,0.0,1), ncol=2))),
                 "group" = c(rep("A", 100), rep("B", 100)))
plot(df$X1, df$X2, xlim = c(-4,4), ylim = c(-4,4),
     col=c(rep("green", 100), rep("blue", 100)),
     pch = as.character(1:200))
abline(h=0, col="black")
legend("topleft", legend=c("Group A", "Group B"), col = c("green", "blue"), pch = c(1,1))








