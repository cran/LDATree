## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(LDATree)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center"--------------------
library(LDATree)
set.seed(443)
diamonds <- as.data.frame(ggplot2::diamonds)[sample(53940, 2000),]
datX <- diamonds[, -2]
response <- diamonds[, 2] # we try to predict "cut"
fit <- Treee(datX = datX, response = response, verbose = FALSE) # by default, it is a pre-stopping FoLDTree
# fit <- Treee(datX = datX, response = response, verbose = FALSE, ldaType = "all", pruneMethod = "post") # if you want to fit a post-pruned LDATree.

## ----fig.asp=0.618,out.width = "80%",fig.align = "center", eval=FALSE---------
#  # View the overall tree.
#  plot(fit)

## ----out.width = '100%',fig.align = "center", echo = FALSE--------------------
knitr::include_graphics("README-plot1-1.png")

## ----echo=TRUE, eval=FALSE----------------------------------------------------
#  # Three types of individual plots
#  # 1. Scatter plot on first two LD scores
#  plot(fit, datX = datX, response = response, node = 1)

## ----out.width = '100%',fig.align = "center", echo = FALSE--------------------
knitr::include_graphics("README-plot2-1.png")

## ----echo=TRUE, eval=FALSE----------------------------------------------------
#  # 2. Density plot on the first LD score
#  plot(fit, datX = datX, response = response, node = 7)

## ----out.width = '100%',fig.align = "center", echo = FALSE--------------------
knitr::include_graphics("README-plot2-2.png")

## -----------------------------------------------------------------------------
# 3. A message
plot(fit, datX = datX, response = response, node = 2)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# Prediction only.
predictions <- predict(fit, datX)
head(predictions)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# A more informative prediction
predictions <- predict(fit, datX, type = "all")
head(predictions)

