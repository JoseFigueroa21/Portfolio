## Jose Figueroa
## Math 2200
## 11/20/2022

require(openintro)
require(mosaic)
attach(stats_data)

## Graphs used
histogram(~GlobalSales, data = stats_data)
qqnorm(GlobalSales)
plot(GlobalSales~Rank, data = stats_data)

## additional code
Rank.GlobalSales.lm <- lm(GlobalSales~Rank, data = stats_data)
summary(Rank.GlobalSales.lm)