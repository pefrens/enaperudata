test_that("list_ena_2023_modules devuelve un tibble con la estructura correcta", {
  res <- list_ena_2023_modules()

  # Verificar que sea un tibble/data.frame
  expect_s3_class(res, "tbl_df")

  # Verificar dimensiones (21 módulos, 4 columnas)
  expect_equal(nrow(res), 21)
  expect_equal(ncol(res), 4)

  # Verificar nombres de columnas
  expect_named(res, c("module_code", "module_tag", "modulo_es", "module_en"))

  # Verificar tipos de datos
  expect_type(res$module_code, "integer")
  expect_type(res$module_tag, "character")

  # Verificar que los códigos estén en el rango correcto
  expect_true(all(res$module_code >= 1828 & res$module_code <= 1848))
})

test_that("list_ena_2024_modules devuelve un tibble con la estructura correcta", {
  res <- list_ena_2024_modules()

  # Verificar dimensiones
  expect_equal(nrow(res), 21)
  expect_equal(ncol(res), 4)

  # Verificar que los tags internos sigan el patrón esperado
  expect_true(all(grepl("^modulo\\d{4}$", res$module_tag)))

  # Verificar que no haya valores nulos
  expect_false(any(is.na(res)))

  # Verificar un contenido específico (ej. el primer módulo)
  expect_equal(res$module_code[1], 1893)
  expect_equal(res$modulo_es[1], "Características de la unidad agropecuaria al día de la entrevista")
})

test_that("Las funciones de 2023 y 2024 son distintas en códigos pero similares en estructura", {
  df_2023 <- list_ena_2023_modules()
  df_2024 <- list_ena_2024_modules()

  # Los códigos no deben solaparse
  expect_true(length(intersect(df_2023$module_code, df_2024$module_code)) == 0)

  # Las columnas deben ser idénticas
  expect_equal(names(df_2023), names(df_2024))
})
