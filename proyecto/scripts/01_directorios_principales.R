# Definir directorios principales
dir_base <- "C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto"
dir_datos_raw <- file.path(dir_base, "data", "raw")
dir_datos_pro <- file.path(dir_base, "data", "processed")
dir_resultados_fig <- file.path(dir_base, "results", "figures")
dir_resultados_tab <- file.path(dir_base, "results", "tables")

# Función para verificar y crear directorios si no existen
crear_directorio <- function(dir) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = T)
    message("Directorio creado:", dir)
  } else {
    message("Directorio ya existe: ", dir)
  }
}

# Crear directorios
crear_directorio(dir_base)
crear_directorio(dir_datos_raw)
crear_directorio(dir_datos_pro)
crear_directorio(dir_resultados_fig)
crear_directorio(dir_resultados_tab)
