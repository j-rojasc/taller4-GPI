# Este código analiza los datos y genera visualizaciones de los mismos

## Cargar las librerías necesarias
#install.packages("pacman")
library(pacman)
p_load(dplyr, ggplot2, psych)

## Ejecutar el script que carga los directorios principales
source("C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto/scripts/01_directorios_principales.R")

## Cargar los datos limpios
cleaned_data <- read.csv(file.path(dir_datos, "cleaned_data.csv"))

## Ajustar formato de fecha
cleaned_data <- cleaned_data %>%  mutate(Fecha = as.Date(Fecha))

## Crear estadísticas descriptivas
est_descriptivas <- describe(cleaned_data)

## Guardar la tabla de estadísticas descriptivas
write.csv(est_descriptivas,
          file.path(dir_resultados, "estadisticas_descriptivas.csv"),
          row.names = F)

## Crear una gráfica de línea de Ventas en el tiempo
plot_ventas <- ggplot(cleaned_data, aes(x = Fecha, y = Ventas)) +
  geom_line() + theme_minimal()

## Guardar la gráfica en resultados
ggsave(file.path(dir_resultados, 'Ventas.png'),
       plot = plot_ventas, width = 10, height = 8)
