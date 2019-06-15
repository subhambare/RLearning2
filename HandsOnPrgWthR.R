#==============================
  #Project 1. Rolling Dice
#==============================
#--- Use of sample function

sample(1:6,1)


#---Writing Functions

roll = function () {
  die = 1:6
  dice = sample(die, size = 2, replace = TRUE)
  sum(dice)
}

#--- Function with Arguments

roll2 = function (bones) {
  die = 1:6
  dice = sample(bones, size = 2, replace = TRUE)
  sum(dice)
}


#---Installing Packages and loading Library

install.packages("ggplot2")
library("ggplot2")

#---qplot = Hostogram, count of historical occurancesis.vector(die)



x = c(-1,0.8,0.6,0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
y=x^3

qplot(x,binwidth=1)
qplot(x,y)

#---- Replicate

rolls = replicate(1000,roll())
qplot(rolls,binwidth=1)

# ---Getting Help

?sqrt
?log10
?sample

#----probability argument with sample function

roll = function () {
  die = 1:6
  dice = sample(die, size = 2, replace = TRUE,
                prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice)
}

rolls = replicate(10000,roll())
qplot(rolls,binwidth=1)

#---- typeof

length(die)
typeof(die)
is.vector(die)

#==============================
#Project 2. Playing Cards
#==============================
#always gives same output when deall is called

deal = function(cards123)  {
  cards123[1,]
}

# to get different output

deal = function(cards123)  {
  card = deck[1,]
  assign("deck", deck[-1,], envir = globalenv())
  card
}

shuffle = function (cards) {
  random = sample (1:52, size = 52)
  assign("deck", DECK[random,], envir = globalenv())
}

setup =  function (deck) {
  DECK = deck
  DEAL = function()  {
    card = deck[1,]
    assign("deck", deck[-1,], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE = function () {
    random = sample (1:52, size = 52)
    assign("deck", DECK[random,], envir = parent.env(environment()))
  }
  list(deal = DEAL, shuffle = SHUFFLE)
}

cards = setup(deck)
deal=cards$deal
shuffle=cards$shuffle
rm(deck)
shuffle()
deal()
BlackJack!!!
  

  #==============================
#Project 3. Slot Machiness
#==============================
get_symbols = function () {
  wheel = c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample (wheel, size = 3, replace = TRUE,
          prob = c (0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

play = function () {
  symbols = get_symbols()
  print(symbols)
  score(symbols)
}

score = function(symbols) {
  same = symbols[1] == symbols[2] && symbols [2] == symbols[3]
  bars = symbols %in% c("B", "BB", "BBB")
  #get prise
  if (same) {
    payouts = c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, 
                "B" = 10, "C" = 10, "0" = 0)
    prize = unname(payouts[symbols[1]])
    
  }
}
