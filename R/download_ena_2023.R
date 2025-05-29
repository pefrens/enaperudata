#' Download Modules of the National Agricultural Survey 2023 (INEI - Peru)
#'
#' Downloads one, several, or all data modules from the
#' National Agricultural Survey 2023 (Encuesta Nacional Agropecuaria ENA-2023),
#' conducted by the National Institute of Statistics and Informatics (INEI) of Peru.
#'
#' Module descriptions are based on INEI documentation.
#'
#' @param modulo A character vector specifying which modules to download.
#'   Use `"all"` (default) to download all modules, or specify one or more module names
#'   such as `"modulo1830"`, `"modulo1831"`, etc. Use \code{list_ena_2023_modules()} to see available modules.
#' @param dir_output A character string specifying the directory where the files
#'   will be saved and extracted. Defaults to `"data_ena_peru"`.
#'
#' @return A character string with the absolute path of the output directory where the files were extracted.
#' @importFrom utils download.file unzip
#' 
#' @export
download_ena_2023 <- function(modulo = "all", dir_output = "data_ena_peru") {
  urls_modulos <- list(
    modulo1828 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1828.zip",
    modulo1829 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1829.zip",
    modulo1830 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1830.zip",
    modulo1831 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1831.zip",
    modulo1832 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1832.zip",
    modulo1833 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1833.zip",
    modulo1834 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1834.zip",
    modulo1835 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1835.zip",
    modulo1836 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1836.zip",
    modulo1837 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1837.zip",
    modulo1838 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1838.zip",
    modulo1839 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1839.zip",
    modulo1840 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1840.zip",
    modulo1841 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1841.zip",
    modulo1842 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1842.zip",
    modulo1843 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1843.zip",
    modulo1844 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1844.zip",
    modulo1845 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1845.zip",
    modulo1846 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1846.zip",
    modulo1847 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1847.zip",
    modulo1848 = "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/CSV/922-Modulo1848.zip"
  )

  if (identical(modulo, "all")) {
    selected_modules <- names(urls_modulos)
  } else {
    selected_modules <- tolower(modulo)
    invalid <- setdiff(selected_modules, names(urls_modulos))
    if (length(invalid) > 0) {
      stop("Invalid modules: ", paste(invalid, collapse = ", "))
    }
  }

  if (!dir.exists(dir_output)) {
    dir.create(dir_output, recursive = TRUE)
  }

  for (mod in selected_modules) {
    url <- urls_modulos[[mod]]
    zip_filename <- basename(url)
    zip_path <- file.path(dir_output, zip_filename)

    tryCatch({
      download.file(url, destfile = zip_path, mode = "wb")
      cat(paste("Downloaded:", zip_filename, "\n"))
      unzip(zip_path, exdir = dir_output)
      cat(paste("Unzipped to:", dir_output, "\n"))
    }, error = function(e) {
      cat(paste("Error downloading", mod, ":", e$message, "\n"))
    }, finally = {
      if (file.exists(zip_path)) file.remove(zip_path)
    })
  }

  return(normalizePath(dir_output))
}