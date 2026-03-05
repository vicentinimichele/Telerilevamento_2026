#Primo script di R

2+3

#oggetti e assegnazione
michele <- 2+3
michele

tecla <- 4+6

#tutte le operazioni
michele + tecla
michele ^ tecla 

# arreys o vettori
sonia <- c(10, 8, 3, 1, 0) # funzione e argomenti 
giorgia <- c(3, 10, 20, 50, 100)

plot(giorgia, sonia) 

plot(giorgia, sonia, xlab="Inquinanti", ylab="Numero delfini", pch=19, cex=2) # cex dimensione

# installazione pacchetti
# da CRAN
install.packages("terra")
library(terra)

# da GitHub
install.packages("devtools") # remotes
library(devtools)

install_github("ducciorocchini/imageRy")
