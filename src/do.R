## Ryan Elmore
## Date: 18 Mar 2014
## Description: Betting program for KY Derby Party

.project.path <- "~/Side_Projects/DerbyParty/"

## Dependencies:
source(paste(.project.path, "src/load.R", sep=""))

set.seed(298)
kBets <- 50
bets.df <- data.frame(bettor = sample(c(letters, LETTERS), 
                                      size = kBets, 
                                      rep = F), 
                      amount = sample(c(1, 5), size = kBets, rep = T),
                      horse = sample(letters[1:5], size = kBets, rep = T),#)
                      type = sample(c("win", "place", "show"), 
                                    size = kBets, rep = T))

results <- c("a", "b", "e")
bets <- bets.df[bets.df$type == "win", ]
ss <- FinalPayoutOld(bets, bet.type = "win", results)

bets.df.2 <- cbind(bets.df, type = rep("show", kBets))
gg <- FinalPayout(bets.df, bet.type = "show", results)

tt <- bets.df[bets.df$type == "win", ]

total.pool <- sum(bets.df$amount)   
total.win <- sum(bets.df$amount[bets.df$horse == results[1]])
total.place <-              