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

FinalPayout <- function(bet.df, results){
  kBets <- length(bet.df$horse)
  mult <- FinalMultiplier(bet.df, kFactor = length(results))
  print(mult)
  win.payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet.df$horse[i] %in% results) {
      multiplier <- mult$mult[mult$horses == bet.df$horse[i]]
      win.payouts[i] <- bet.df$amount[i]*(multiplier + 1)
    }
  }
  bet.df$payouts <- win.payouts
  return(bet.df)
}

FinalMultiplier <- function(bet.df, kFactor){
  horses <- unique(bet.df$horse)
  bet <- 1:length(horses)
  ## amount bet per horse
  for (horse in bet){
    bet[horse] <- sum(bet.df$amount[bet.df$horse == horses[horse]])
  }
  mult <- (sum(bet.df$amount)/kFactor - bet)/bet
  return(data.frame(horses = horses, total = bet, multiplier = mult))
}

AllPayouts <- function(bet.df, results){
  win <- FinalPayout(bet.df[bet.df$type == 'win', ], results[1])
  place <- FinalPayout(bet.df[bet.df$type == 'place', ], results[1:2])
  show <- FinalPayout(bet.df[bet.df$type == 'show', ], results[1:3])
  return(list(win = win, place = place, show = show))
}
