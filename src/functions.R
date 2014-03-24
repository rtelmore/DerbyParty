## Ryan Elmore
## Date: 18 Mar 2014
## Include project-specific functions in this file

FinalPayout <- function(bet.df, results){
  kBets <- length(bet.df$horse)
  mult <- FinalMultiplier(bet.df, kFactor = sum(results %in% bet.df$horse))
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
