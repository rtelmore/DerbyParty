## Ryan Elmore
## Date: 18 Mar 2014
## Include project-specific functions in this file

FinalWinPayout <- function(bet.df, bet.type = "win", results){
  kBets <- length(bet.df$horse)
  bet.types <- 1:3
  names(bet.types) <- c("win", "place", "show")
  kFactor <- bet.types[bet.type]
  odds <- FinalOdds(bet.df, kFactor = kFactor)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet.df$horse[i] %in% results) {
      win.payouts[i] <- bet.df$amount[i]*odds$odds[odds$horses == results[1]] +
                        bet.df$amount[i]
    }
  }
  bet.df$payouts <- win.payouts
  return(bet.df)
}

FinalPlacePayout <- function(bet.df, odds. results) {
  kBets <- length(bet.df$horse)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet.df$horse[i] %in% results[1:2]) {
      win.payouts[i] <- bet.df$amount[i]*odds$odds[odds$horse == results[1]] +
                        bet.df$amount[i]
    }
  }
  bet.df$payouts <- win.payouts
  return(bet.df)
  
}

FinalOdds <- function(bet.df, kFactor){
  horses <- unique(bets.df$horse)
  bet <- 1:length(horses)
  for (horse in bet){
    bet[horse] <- sum(bets.df$amount[bets.df$horse == horses[horse]])
  }
  odds <- (sum(bets.df$amount)/kFactor - bet)/bet
  return(data.frame(horses = horses, total = bet, odds = odds))
}

