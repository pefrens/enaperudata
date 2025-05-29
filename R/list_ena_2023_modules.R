#' List of Available ENA 2023 Modules (Spanish and English)
#'
#' Returns the codes, internal tags, and titles of all available modules from the 
#' 2023 National Agricultural Survey (Encuesta Nacional Agropecuaria - ENA) conducted 
#' by the National Institute of Statistics and Informatics (INEI) of Peru. 
#' The module titles are provided in both Spanish and English to facilitate access for native users 
#' and international audiences.
#' 
#' @return A `tibble` with 4 columns:
#' \describe{
#'   \item{module_code}{Official numeric code of the module as defined by INEI.}
#'   \item{module_tag}{Internal name or tag used in the package, useful for download functions.}
#'   \item{modulo_es}{Spanish title of the module, as published by INEI.}
#'   \item{module_en}{English translation of the module title, useful for non-Spanish-speaking users.}
#' }
#' @examples
#' list_ena_2023_modules()
#'
#' @export
list_ena_2023_modules <- function() {
  tibble::tibble(
    module_code = 1828:1848,
    module_tag = paste0("modulo", 1828:1848),
    modulo_es = c(
      "Caracter\u00edsticas de la unidad agropecuaria al d\u00eda de la entrevista",
      "Caracter\u00edsticas de la unidad agropecuaria en los \u00faltimos 12 meses",
      "Superficie cosechada, sembrada, producci\u00f3n y destino de los cultivos cosechados",
      "P\u00e9rdida total de la producci\u00f3n o superficie sembrada",
      "Derivados agr\u00edcolas de los cultivos cosechados",
      "Subproductos agr\u00edcolas de los cultivos cosechados",
      "Costos de producci\u00f3n de los cultivos cosechados",
      "Buenas pr\u00e1cticas agr\u00edcolas (para los cultivos cosechados y no cosechados)",
      "Actividad pecuaria al d\u00eda de la entrevista",
      "Actividad pecuaria en los \u00faltimos 12 meses",
      "Subproductos pecuarios",
      "Derivados pecuarios",
      "Buenas pr\u00e1cticas pecuarias",
      "Inocuidad",
      "Servicios de extensi\u00f3n agraria",
      "Asociatividad",
      "Servicios financieros",
      "Costos de producci\u00f3n de la actividad agropecuaria",
      "Caracter\u00edsticas del productor agropecuario/a y su familia",
      "Intenci\u00f3n de siembra",
      "Maquinaria y/o equipo"
    ),
    module_en = c(
      "Characteristics of the agricultural unit on the day of the interview",
      "Characteristics of the agricultural unit in the last 12 months",
      "Harvested area, planted area, production and destination of harvested crops",
      "Total production or planted area loss",
      "Agricultural derivatives of harvested crops",
      "Agricultural by-products of harvested crops",
      "Production costs of harvested crops",
      "Good agricultural practices (for harvested and non-harvested crops)",
      "Livestock activity on the day of the interview",
      "Livestock activity in the last 12 months",
      "Livestock by-products",
      "Livestock derivatives",
      "Good livestock practices",
      "Food safety",
      "Agricultural extension services",
      "Associativity",
      "Financial services",
      "Production costs of the agricultural activity",
      "Characteristics of the agricultural producer and their family",
      "Sowing intention",
      "Machinery and/or equipment"
    )
  )
}
