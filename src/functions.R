## Ryan Elmore
## Date: 18 Mar 2014
## Include project-specific functions in this file

FinalPayout <- function(bet.df, odds, results){
  kBets <- length(bet.df$horse)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet.df$horse[i] == results[1]) {
      win.payouts[i] <- bet.df$amount[i]*odds$odds[odds$horse == results[1]] +
                        bet.df$amount[i]
    }
  }
  bet.df$payouts <- win.payouts
  return(bet.df)
}


FinalOdds <- function(bet.df){
  horses <- unique(bets.df$horse)
  bet <- 1:length(horses)
  for (horse in bet){
    bet[horse] <- sum(bets.df$amount[bets.df$horse == horses[horse]])
  }
  odds <- data.frame(horse = horses, amount.bet = bet, 
                     odds = (sum(bets.df$amount) - bet)/bet)
  return(odds)
}
