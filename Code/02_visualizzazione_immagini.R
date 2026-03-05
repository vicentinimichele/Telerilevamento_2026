# Codice R per visualizzare dati multispettrali 

# installare pacchetto viridis
install.packages("viridis")

library(terra) # per usare i dati spaziali
library(imageRy) # pacchetto per le immagini satellitari
library(viridis)

# Ogni funzione di imageRy inizia con im.
im.list()

# Bande sentinel https://gisgeography.com/sentinel-2-bands-combinations/ 

# importare le bande che ci interessano
b2 <- im.import("sentinel.dolomites.b2.tif")

# Modificare la palet colori
cl <- colorRampPalette(c("chartreuse4", "darkorange2", "deeppink4"))(100)
plot(b2, col=cl)

# usiamo un numero minore di sfumature
cl <- colorRampPalette(c("chartreuse4", "darkorange2", "deeppink4"))(3)
plot(b2, col=cl)

# Usiamo viridis per cambiare colori del plot
plot(b2, col=inferno (100))
plot(b2, col=mako (100))

# esercizio cambiare colore in scala di grigio
cl <- colorRampPalette(c("gray1", "gray73", "gray100"))(100)
plot(b2, col=cl)

# par = obrobrio
par(mfrow=c(1,2))
plot(b2, col=inferno (100))
plot(b2, col=cl)

# per chiudere le finestre grafiche
dev.off()

#funzione faciel facile per par
im.multiframe(1,2)
plot(b2, col=inferno (100))
plot(b2, col=cl)
