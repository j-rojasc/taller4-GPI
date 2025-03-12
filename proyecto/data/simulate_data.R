# Cargar librerías necesarias
## Cargar las librerías necesaria
install.packages("pacman")
library(pacman)
p_load(dplyr, ggplot2)

## Ejecutar el script que carga los directorios principales
source("C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto/scripts/01_directorios_principales.R")
# Configurar semilla
set.seed(111)

# Simular datos
n <- 500
simulated_data <- data.frame(
  Fecha = seq(as.Date('2023-01-01'), by = 'day', length.out = n),
  Ventas = rnorm(n, mean = 200000, sd = 20),
  Publicidad_Digital = rnorm(n, mean = 35000, sd = 5),
  Publicidad_Social = rnorm(n, mean = 20000, sd = 5),
  Publicidad_TV = rnorm(n, mean = 40000, sd = 5)
)

# Introducir valores faltantes
simulated_data$Ventas[sample(1:500, 10)] <- NA
simulated_data$Publicidad_TV[sample(1:500, 30)] <- NA

# Guardar los datos
write.csv(simulated_data, file.path(dir_datos,'raw_data.csv'), row.names = F)
