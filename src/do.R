## Ryan Elmore
## Date: 18 Mar 2014
## Description: Betting program for KY Derby Party

.project.path <- "~/Side_Projects/DerbyParty/"

## Dependencies:
source(paste(.project.path, "src/load.R", sep=""))

set.seed(298)
bets.df <- data.frame(bettor = LETTERS[1:10], 
                      amount = sample(c(1, 5), size = 10, rep = T),
                      horse = sample(letters[1:5], size = 10, rep = T))

results <- c("a", "b", "e")

total.pool <- sum(bets.df$amount)   
total.win <- sum(bets.df$amount[bets.df$horse == results[1]])
total.place <-              