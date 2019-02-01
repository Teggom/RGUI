# This code is for anyone who might have interest in improving their math skills.
# There are multiple math creation tools. 
# Please feel free to reach out to me with suggestions
if(!("tcltk2" %in% installed.packages())){install.packages("tcltk2");library("tcltk2")}else{library("tcltk2")}
if(!("primes" %in% installed.packages())){install.packages("primes");library("primes")}else{library("primes")}
Functions = c("Check_If_Prime")

# Given a range between two numbers, you will be asked if a given number is prime or not. 
# range_lower = <lower bound>
# range_upper = <upper bound>
Check_If_Prime <- function(range_lower = 2, range_upper = 101){
  # Window
  win1 <- tktoplevel()  
  tktitle(win1) <- "Problem Window"
  
  # Menu
  win1$env$menu <- tk2menu(win1)
  tkconfigure(win1, menu = win1$env$menu)
  win1$env$menuFile <- tk2menu(win1$env$menu, tearoff = FALSE)
  tkadd(win1$env$menuFile, "command", label = c("Quit"), 
                             command = function() {tkdestroy(win1)})
  tkadd(win1$env$menu, "cascade", label = "File", menu = win1$env$menuFile)
  
  # Text
  Number <- sample(size = 1, x = range_lower:range_upper)
  labelText <- tclVar(paste0("Number to check is...    ", Number))
  win1$env$label <- tk2label(win1, textvariable = labelText)
  tkgrid(win1$env$label, pady = 40)
  
  # Buttons 
  guess <- tclVar(0)
  win1$env$buttonYES <- tk2button(win1, text = "Is Prime!", width = -5,
                                  command = function(){tclvalue(guess) <- T})
  win1$env$buttonNO <- tk2button(win1, text = "Not Prime!", width = -5, 
                                 command = function(){tclvalue(guess) <- F})
  tkgrid(win1$env$buttonYES, win1$env$buttonNO, padx = 30, pady = 15)
  
  # Wait for Guess
  tkwait.variable(guess)
  
  # Respond to user
  GUESS <- tclvalue(guess)
  if(GUESS == "0"){GUESS <- F}  
  if(GUESS == "1"){GUESS <- T}
  if(is_prime(Number) == GUESS){
    tkmessageBox(message = "CORRECT!")
  } else {
    tkmessageBox(message = "WRONG!")
  }
  tkdestroy(win1)
  
  
}