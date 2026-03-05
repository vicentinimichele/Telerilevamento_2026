# Codice R per visualizzare dati multispettrali 

# installare pacchetto viridis
install.packages("viridis")

library(terra) # per usare i dati spaziali
library(imageRy) # pacchetto per le immagini satellitari
library(viridis)

# Ogni funzione di imageRy inizia con im.
im.list()

# Bande sentinel https://gisgeography.com/sentinel-2-bands-combinations/ 

# importare le bande che ci interessano colore blu
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

# Importare banda del verde b3
b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3, col=magma (100))

# Importare banda del rosso b4
b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=magma (100))

# Importare banda del near infrared b8
b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=viridis (100))

# Esercizio multiframe 4 bande, legende con i colori giusti
b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")
cl2 <- colorRampPalette(c("dark blue", "blue", "light green"))(100)
cl3 <- colorRampPalette(c("dark green", "green", "light green"))(100)
cl4 <- colorRampPalette(c("red4", "red", "pink"))(100)
cl8 <- colorRampPalette(c("palevioletred4", "sienna", "springgreen2"))(100)

im.multiframe(2,2)
plot(b2, col=cl2 )
plot(b3, col=cl3 )
plot(b4, col=cl4 )
plot(b8, col=cl8 )

im.multiframe(2,2)
plot(b2, col=inferno (100))
plot(b3, col=inferno (100))
plot(b4, col=inferno (100))
plot(b8, col=inferno (100))

# stack per mettere tutte le immagini
sentinel <- c(b2, b3, b4, b8)
plot(sentinel, col=inferno (100))

#per vedere solo una banda
plot(sentinel$sentinel.dolomites.b8)

#layer1=b2 layer2=b3, layer3=b4, layer4=b8
plot(sentinel[[2]]) #layer 2 quindi la b3
plot(sentinel[[4]]) #layer 2 quindi la b8
