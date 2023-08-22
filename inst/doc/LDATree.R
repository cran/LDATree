## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(LDATree)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# Build a tree using direct-stopping rule
fit <- Treee(Species~., data = iris)

# Build a tree using cross-validation
set.seed(443)
fitCV <- Treee(Species~., data = iris, pruneMethod = "CV")

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# View the overall tree
plot(fit) # Tips: Try clicking on the nodes...

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# Three types of individual plots
# 1. Scatter plot on first two LD scores
plot(fit, data = iris, node = 1)

# 2. Density plot on the first LD score
plot(fit, data = iris, node = 3)

# 3. A message
plot(fit, data = iris, node = 5)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# Prediction only
predictions <- predict(fit, iris)
head(predictions)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# A more informative prediction
predictions <- predict(fit, iris, type = "all")
head(predictions)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# Experimental feature: LDAGrove
# If you use CV to prune the tree, you can try an ensemble prediction
predictions <- predict(fitCV, iris, type = "grove")
head(predictions)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
# 
irisMissing <- iris
for(i in 1:4) irisMissing[sample(150,20),i] <- NA
fitMissing <- Treee(Species~., data = irisMissing)
plot(fitMissing, data = irisMissing, node = 1)

## ----fig.asp=0.618,out.width = "100%",fig.align = "center", echo=TRUE---------
fitLDAgsvd <- ldaGSVD(Species~., data = iris)
predictionsLDAgsvd <- predict(fitLDAgsvd, newdata = iris)
mean(predictionsLDAgsvd == iris$Species)

