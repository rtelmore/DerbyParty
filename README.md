Derby Party Betting App
==========

Making the KY Derby Party more exciting with betting!

Howto:

```R
source("functions.R")

set.seed(298)
kBets <- 10
df <- data.frame(bettor = sample(LETTERS, size = kBets, rep = F),
                 amount = sample(c(1, 5), size = kBets, rep = T),
                 horse = sample(letters[1:5], size = kBets, rep = T),
                 type = sample(c("win", "place", "show"), size = kBets,
                              rep = T))

results <- c("a", "e", "d")

AllPayouts(df, results)
```
