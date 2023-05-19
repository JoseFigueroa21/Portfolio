require(openintro)
require(mosaic)
attach(stats_data)

histogram(~GlobalSales, data = stats_data)
qqnorm(GlobalSales)
plot(GlobalSales~Rank, data = stats_data)

Rank.GlobalSales.lm <- lm(GlobalSales~Rank, data = stats_data)
summary(Rank.GlobalSales.lm)
