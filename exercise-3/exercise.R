# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')
install.packages('dplyr')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
library(dplyr)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
filter.year.model <- filter(vehicles, year == 2015, make == 'Acura')
best.acura.car.mpg.2015 <- filter(filter.year.model, hwy == max(hwy))
model.best <- select(best.acura.car.mpg.2015, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best.model <- select(
  filter(
    filter(vehicles, make == 'Acura', year == 2015
    ), hwy == max(hwy)
  ), model
)


# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.model.easy <- filter(vehicles, year == 2015, make == 'Acura') %>% 
                   filter(hwy == max(hwy)) %>% 
                   select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
