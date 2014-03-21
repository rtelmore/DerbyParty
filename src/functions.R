## Ryan Elmore
## Date: 18 Mar 2014
## Include project-specific functions in this file

FinalPayout <- function(bet.df, bet.type = "win", results){
  new.df <- bet.df[bet.df$type == bet.type, ]
  print(new.df)
  kBets <- length(new.df$horse)
  bet.types <- 1:3
  names(bet.types) <- c("win", "place", "show")
  kFactor <- bet.types[bet.type]
  odds <- FinalOdds(new.df, kFactor = kFactor)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(new.df$horse[i] %in% results[1:kFactor]) {
      multiplier <- odds$odds[odds$horses == new.df$horse[i]]
      win.payouts[i] <- new.df$amount[i]*(multiplier + 1)
    }
  }
  new.df$payouts <- win.payouts
  return(new.df)
}

FinalPayoutOld <- function(bet.df, bet.type = "win", results){
  kBets <- length(bet.df$horse)
  bet.types <- 1:3
  names(bet.types) <- c("win", "place", "show")
  kFactor <- bet.types[bet.type]
  odds <- FinalOdds(bet.df, kFactor = kFactor)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet.df$horse[i] %in% results[1:kFactor]) {
      multiplier <- odds$odds[odds$horses == bet.df$horse[i]]
      win.payouts[i] <- bet.df$amount[i]*(multiplier + 1)
    }
  }
  bet.df$payouts <- win.payouts
  return(bet.df)
}

FinalPayoutAll <- function(bet.df, results){
  kBets <- length(bet.df$horse)
  odds <- FinalOdds(bet.df, kFactor = 3)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet.df$horse[i] %in% results[1:3]) {
      multiplier <- odds$odds[odds$horses == bet.df$horse[i]]
      win.payouts[i] <- bet.df$amount[i]*(multiplier + 1)
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

