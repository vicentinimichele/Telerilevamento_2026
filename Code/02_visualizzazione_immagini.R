# Codice R per visualizzare dati multispettrali 

# installare pacchetto viridis
install.packages("viridis")

library(terra) # per usare i dati spaziali
library(imageRy) # pacchetto per le immagini satellitari
library(viridis) # colori per cose
library(ggplot2) # grafici
library(patchwork)

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

b2 <- im.import("sentinel.dolomites.b2.tif")
b3 <- im.import("sentinel.dolomites.b3.tif")
b4 <- im.import("sentinel.dolomites.b4.tif")
b8 <- im.import("sentinel.dolomites.b8.tif")

im.ggplot(b8)

# per plottare più immagini, li posso unire trattandoli come oggetti

p1 <- im.ggplot(b8)
p2 <- im.ggplot(b4)

p1 + p2

# Metodi Multiframe
# 1. par(mfrow=c(1,2))
# 2. im.multiframe(1,2)
# 3. stack
# 4. ggplot2 patchwork

# RGB plotting
sentinel <- c(b2, b3, b4, b8)

# 1=b2 blu
# 2=b3 verde
# 3=b4 rosso
# 4=b5 infrarosso vicino

# tre filtri ma con 4 bande

# creiamo una per il visibile
im.plotRGB(sentinel, r=3, g=2, b=1) # funzione per plottare a colori naturali

# spostiamo le bande e i colori per RGB
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors, banda infrarosso apporta molte informazioni

im.multiframe(1,2)
im.plotRGB(sentinel, r=3, g=2, b=1) # funzione per plottare a colori naturali
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors

plot(sentinel[[4]])
im.plotRGB(sentinel, r=4, g=3, b=2) # false colors

im.plotRGB(sentinel, r=3, g=4, b=2) # nir (infrarosso) nel verde  
im.plotRGB(sentinel, r=3, g=2, b=4) # nir nel blu, utile per vedere la deforestazione

# multi frame con le 4 visualizzazioni possibili
im.multiframe(2,2)
im.plotRGB(sentinel, r=3, g=2, b=1)
im.plotRGB(sentinel, r=4, g=3, b=2)
im.plotRGB(sentinel, r=3, g=4, b=2) # nir (infrarosso) nel verde  
im.plotRGB(sentinel, r=3, g=2, b=4)

# se mantengo la banda nel nir nello stesso posto ma cambio gli altri colori non cambia praticamente nulla

# per fare un grafico a correlazione?
pairs(sentinel)

# versione semplice della funzione
im.plotRGB(sentinel, 4, 2, 3)

# plotRGB da terra
plotRGB(sentinel, 4, 2, 3, stretch = "lin")
plotRGB(sentinel, 4, 2, 3, stretch = "hist")




