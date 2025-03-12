# Este código contiene el modelo con las variables de interés y corre
# regresiones para encontrar el efecto de las variables predictoras sobre las ventas

## Cargar las librerías necesaria
#install.packages("pacman")
library(pacman)
p_load(dplyr, ggplot2, psych, lmtest, stargazer)

## Ejecutar el script que carga los directorios principales
source("C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto/scripts/01_directorios_principales.R")

## Cargar los datos limpios
cleaned_data <- read.csv(file.path(dir_datos_pro, "cleaned_data.csv"))

## Ajustar formato de fecha
cleaned_data <- cleaned_data %>%  mutate(Fecha = as.Date(Fecha))

## Ajustar modelo de regresión lineal con la variable Ventas como dependiente
## y las variables de Publicidad por canales como predictoras
reg <- lm(Ventas ~ Publicidad_TV + Publicidad_Digital + Publicidad_Social,
             data = cleaned_data)

## Generar resumen del modelo
resultados_reg <- file.path(dir_resultados_tab, "resultados_regresion.html")
stargazer(reg, type = "html", out = resultados_reg)

## Mensaje de confirmación
message("Archivo guardado en: ", resultados_reg)
