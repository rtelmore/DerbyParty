source("functions.R")

df <- data.frame(bettor = c("Ryan E", "Ryan E", "Ryan E", "Tom", "Tom", "Tom", "Tom", "Tom", 
                            "Heather", "Heather", "Heather", "Chris (Seth)", "Baker", "Baker",
                            "Baker", "Matt P", "Matt P", "Maddox", "Maddox", "Maddox", "Jacob",
                            "Jacob", "Maggie", "Caleb", "Caleb", "Caleb", "Greg", "Greg", "Greg",
                            "Damian", "Damian", "Joel", "Ryan E", "Angie", "Angie", "Kate", 
                            "Talia", "Jenny", "Matt Parker", "Rafoul", "Rafoul", "Rafoul",
                            "Rafoul", "Rafoul", "Zoe", "Zoe", "Chidley", "Chidley", "Monte",
                            "Nils", "Nils", "Meg", "Anne", "Danny", "Biagioni", "Biagioni", "X", 
                            "Y"),
                 amount = c(2, 2, 1, rep(2, 5), 2, 1, 1, 5, 2, 1, 1, 5, 5, 5, 5, 5, 4, 4, 1,
                            5, 5, 5, 5, 5, 5, 5, 5, 1, 5, 5, 5, 5, 1, 1, 5, 4, 4, 4, 4, 4, 1, 
                            1, 1, 5, 5, 5, 5, 5, 5, 1, 5, 5, 0, 0),
                 horse = c("D", "F", "O", "A", "D", "E", "F", "T", "E", "C", "L", "O", "T",
                           "Q", "K", "J", "F", "D", "T", "P", "S", "R", "S", "E", "D", "T", "E",
                           "P", "L", "E", "P", "P", "E", "F", "T", "E", "T", "L", "S", "E", 
                           "D", "P", "M", "T", "L", "A", "G", "B", "E", "E", "P", "T", "H", "H",
                           "I", "O", "ZZ", "WW"),
                 type = c(rep("show", 56), "win", "place"))

results <- c("E", "Q", "D")