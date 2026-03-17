# Codici per calcolare gli indici spettrali in R

library(imageRy) 
library(terra)
library(viridis)

# Lista file
im.list()

# importiamo immagine
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# Essendo un jpg senza sistema di riferimento è girata storta usiamo flip del pacchetto terra
mato1992 <- flip(mato1992)

# l1=NIR l2=red l3=green
im.plotRGB(mato1992, 1, 2, 3) #mettiamo il NIR nella componente red, tutto quello che è rosso è foresta pluviale
im.plotRGB(mato1992, 2, 1, 3) #NIR nel colore verde, suolo rosa
im.plotRGB(mato1992, 3, 2, 1) #NIR sul blu, suolo giallo

# immagini mato 2006
mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
im.plotRGB(mato2006, r=1, g=2, b=3) # vidiamo meno solidi disciolti in acqua

# multiframe per il confronto
im.multiframe(3,2)
# NIR sul rosso
im.plotRGB(mato1992, 1, 2, 3)
im.plotRGB(mato2006, 1, 2, 3)

# # NIR sul verde
im.plotRGB(mato1992, 2, 1, 3)
im.plotRGB(mato2006, 2, 1, 3)

# # NIR sul blu
im.plotRGB(mato1992, 3, 2, 1)
im.plotRGB(mato2006, 3, 2, 1)

# possiamo calcolare l'indice DVI
dvi1992 <- mato1992[[1]] - mato1992[[2]] # 1 per dire il NIR, e due per il rosso
plot(dvi1992) # dove ci sono valori alti c'è tanta vegetazione, vediamo il range che varia da +255 a -255

# 8 bit
# NIR - red = 255 - 0 = +255 massimo DVI
# NIR - red = 0 - 255 = -255 minimo DVI
# range DVI immagine 8 bit +255 e -255

# minimo e massimo 4 bit -15 e +15 

# per poter confrontare DVI di diverse grandezze di immagini su usa il NDVI, si standardizzano i dati 
# 8 bit
# (NIR - red) / (NIR + red) = (255 - 0) / (255 + 0) = +1 massimo NDVI
# (NIR - red) / (NIR + red) = (0 - 255) / (0 + 255) = -1 minimo NDVI
# NDVI 4 bit: range (0-15)
# (NIR - red) / (NIR + red) = (15 - 0) / (15 + 0) = 1 massimo
# (NIR - red) / (NIR + red) = (0 - 15) / (0 + 15) = -1 minimo

im.multiframe(1,2)
ndvi1992 = (mato1992[[1]] - mato1992[[2]]) / (mato1992[[1]] + mato1992[[2]])
# ndvi1992 = dvi1992 / (mato1992[[1]] + mato1992[[2]])
plot(ndvi1992)

ndvi2006 = (mato2006[[1]] - mato2006[[2]]) / (mato2006[[1]] + mato2006[[2]])
# ndvi2006 = dvi2006 / (mato2006[[1]] + mato2006[[2]])
plot(ndvi2006)

im.multiframe(1,2)
plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

# DVI imageRy
dvi1992 <- im.dvi(mato1992, 1,2)
dvi2006 <- im.dvi(mato2006, 1,2)

im.multiframe(1,2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))

dev.off()

# NDVI imageRy
ndvi1992 <- im.ndvi(mato1992, 1,2)
ndvi2006 <- im.ndvi(mato2006, 1,2)

im.multiframe(1,2)
plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

im.multiframe(2,2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))

plot(ndvi1992, col=inferno(100))
plot(ndvi2006, col=inferno(100))

