## Ryan Elmore
## Date: 18 Mar 2014
## Include project-specific functions in this file

FinalPayout <- function(results, bet.df){
  total.win.pool <- sum(bet.df$amount)
  
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

