Derby Party Betting App
==========

Making the KY Derby Party more exciting with betting!

Howto:

```R
source("functions.R")

set.seed(291298)
kBets <- 25
df <- data.frame(bettor = sample(LETTERS, size = kBets, rep = F),
                 amount = sample(c(1, 5), size = kBets, rep = T),
                 horse = sample(letters[1:5], size = kBets, rep = T),
                 type = sample(c("win", "place", "show"), size = kBets,
                              rep = T))

results <- c("a", "e", "d")

AllPayouts(df, results)

$win
   bettor amount horse type  payouts
6       L      5     d  win 0.000000
7       V      1     e  win 0.000000
10      X      1     d  win 0.000000
11      P      1     e  win 0.000000
14      A      5     d  win 0.000000
16      R      1     a  win 7.666667
18      W      1     a  win 7.666667
19      J      1     a  win 7.666667
20      Z      1     c  win 0.000000
23      Y      5     e  win 0.000000
24      I      1     e  win 0.000000

$place
   bettor amount horse  type payouts
1       E      5     d place       0
3       H      5     a place      14
8       C      1     e place       2
9       D      5     e place      10
12      K      1     d place       0
17      T      5     d place       0
21      U      1     e place       2
22      O      5     c place       0

$show
   bettor amount horse type payouts
2       G      1     a show       7
4       Q      5     d show       5
5       M      5     c show       0
13      N      1     d show       1
15      S      1     d show       1
25      F      1     c show       0

```
