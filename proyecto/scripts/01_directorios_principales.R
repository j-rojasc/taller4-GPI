# Definir directorios principales
dir_base <- "C:/Users/jroja/OneDrive/Documents/GitHub/taller4-GPI/proyecto"
dir_datos <- file.path(dir_base, "data")
dir_resultados <- file.path(dir_base, "results")

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
crear_directorio(dir_datos)
crear_directorio(dir_resultados)
