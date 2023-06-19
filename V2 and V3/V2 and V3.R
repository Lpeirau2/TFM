# 2nd and 3rd visual results

## Data importation
data <- read.csv("path", row.names = 1)
data <- data[, -c(11,14,15,17,18)]
data[is.na(data)] <- 0

data$Minutes = data$Total1+data$Total2

df = data[,c(6:12)]
df$Goals = data$Goals
df$Minutes = data$Minutes
df = df[ -c(1:2), ]

df = df/df$Minutes
df <- data.frame(lapply(df, function(x) ifelse(is.nan(x), 0, x)))

df <- df[, -which(names(df) == "Minutes")]

df$RoL = data$RoL[ c(3:length(data$RoL))]
df$Positions = data$Position[ c(3:length(data$Position))]

row_names <- rownames(data)
rownames(df) <- row_names[ c(3:length(row_names))]

## PCA
data_pca <- prcomp(df[ ,-c(9:10)],  scale = FALSE, center=TRUE)
summary(data_pca)

### PCA illustration
library("factoextra")
fviz_pca_var(data_pca, axes = c(1, 2), ylim = c(-0.05,0.05), xlim = c(-0.04,0.08))
fviz_pca_var(data_pca, axes = c(1, 3))
fviz_pca_ind(data_pca,habillage=df$Position, addEllipses=FALSE, axes= c(1,2))
fviz_pca_ind(data_pca,habillage=df$Position, addEllipses=FALSE, axes= c(1,3))
fviz_pca_biplot(data_pca,habillage=df$Position, addEllipses=FALSE, axes= c(1,2))
fviz_pca_biplot(data_pca,habillage=df$Position, addEllipses=FALSE, axes= c(1,3))

## Gaussian Mixtures
X = df[, -c(9:10)]

library(ggplot2)
library(reshape2)

Xlong = melt(X)
ggplot(data = Xlong) +
  geom_histogram(aes(x = value, y = after_stat(density)), color = 'white', bins = 25) +
  facet_wrap(~variable, scales = 'free', nrow = 2)

SIGMA = cov(X) * (nrow(X)-1) / nrow(X)
MEAN = colMeans(X)

### Minimum log-Likelihood
sum(mvtnorm::dmvnorm(X, MEAN, SIGMA, log = TRUE))

library(data.table)

l_dens = lapply(1:8, function(J){
  rng = range(X[[J]])
  dres = data.table(x = seq(rng[1], rng[2], length.out = 100))
  dres[, px := dnorm(x, MEAN[J], sqrt(SIGMA[J,J]))]
  dres$variable = names(X)[J]
  dres
})

ggplot(data = Xlong) +
  geom_histogram(aes(x = value, y = after_stat(density)), color = 'white', bins = 25) +
  geom_line(data=rbindlist(l_dens), aes(x = x, y = px), col = 'blue') +
  facet_wrap(~variable, scales = 'free', nrow = 2)

### Model
library(mclust)
model = Mclust(X)
model

plot(model, 'BIC')
summary(model)

### Clustering
mdr = MclustDR(model)
plot(mdr, what = 'contour')
mdr$classification
