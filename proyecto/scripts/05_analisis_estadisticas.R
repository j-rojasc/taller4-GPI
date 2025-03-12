## Cargar las librerías necesarias
#install.packages("pacman")
library(pacman)
p_load(dplyr, ggplot2, psych)

## Ejecutar el script que carga los directorios principales
source("C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto/scripts/01_directorios_principales.R")

## Cargar los datos limpios
cleaned_data <- read.csv(file.path(dir_datos_pro, "cleaned_data.csv"))

## Ajustar formato de fecha
cleaned_data <- cleaned_data %>%  mutate(Fecha = as.Date(Fecha))

## Crear estadísticas descriptivas
est_descriptivas <- describe(cleaned_data)