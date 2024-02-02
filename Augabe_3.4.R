# Installieren Sie das Paket testthat, wenn es noch nicht installiert ist
if (!requireNamespace("testthat", quietly = TRUE)) {
  install.packages("testthat")
}

library(testthat)

# Testfall 1
test_that("wichtel_unglueck gibt bei k > n immer 0 zurück", {
  result <- wichtel_unglueck(1, 2)
  expect_equal(result, 0)
})

# Testfall 3
test_that("wichtel_unglueck wirft einen Fehler wenn iterationen nicht nummerisch ist", {
  expect_error(wichtel_unglueck(3, 1, iterationen = "ganz, ganz viele"),
                "Wert muss nummerisch sein")})

# Testfall 3 
test_that("wichtel_unglueck wirft einen Fehler bei n<= 0", {
  expect_error(wichtel_unglueck(0, 4), "n muss größer als 0 sein")
})

# Testfall 4
test_that("wichtel_unglueck wirft einen Fehler bei iterationen <= 0", {
 expect_error(wichtel_unglueck(5, 4, 0), "iterationen muss größer als 0 sein")
})