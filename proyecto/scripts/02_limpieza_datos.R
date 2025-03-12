# Este código limpia la base de datos

## Cargar librerías necesarias
#install.packages("pacman")
library(pacman)
p_load(dplyr)

## Ejecutar el script que carga los directorios principales
source("C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto/scripts/01_directorios_principales.R")

## Cargar los datos crudos
raw_data <- read.csv(file.path(dir_datos_raw,"raw_data.csv"))

# Crear función para reemplazar missing values con la media
reemplazar_na <- function(column) {
  ifelse(is.na(column), mean(column, na.rm = TRUE), column)
}

cleaned_data <- raw_data %>% 
  # Aplicar la función a las columnas relevantes
  mutate(
    Ventas = reemplazar_na(Ventas),
    Publicidad_TV = reemplazar_na(Publicidad_TV),
    Publicidad_Social = reemplazar_na(Publicidad_Social),
    Publicidad_Digital = reemplazar_na(Publicidad_Digital)
  ) %>%
  # Convertir fechas al formato adecuado
  mutate(
    Fecha = as.Date(Fecha)
  ) %>% 
  # Ordenar los datos por fecha
  arrange(Fecha)

## Guardar los datos limpios
write.csv(cleaned_data, file.path(dir_datos_pro,'cleaned_data.csv'), row.names = F)
