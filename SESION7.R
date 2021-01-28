# RETOS SESIÓN 7

url <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

library()
library("rvest")
cont<-read_html(url)

tabla<-html_nodes(cont, "table")

t <- html_table(tabla[1], fill = TRUE)

t <- na.omit(as.data.frame(t))

?gsub
str(t)

u <- sub("MXN","",t$Sueldo)
u <- sub("mes","",u)
u <- sub("/","",u)
u <- sub(",",".",u)
u <- sub("[$),]", "", u)
u <- as.numeric(u)

d <- sub("Sueldos para Data Scientist en ", "", t$Cargo)

tt <- cbind(d,u)
tt <- as.data.frame(tt)

as.numeric(tt$u)

mas <- tt[which.max(as.numeric(tt$u)),]
menos <- tt[which.min(as.numeric(tt$u)),]


#------------------RETO03-------------------------------



