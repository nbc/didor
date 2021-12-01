
test_that("get_data work with last_millesime input", {
  skip_on_cran()
  skip_if_offline()

  get_metadata()

  data <- datasets() %>%
    datafiles() %>%
    last_millesime() %>%
    arrange(rows) %>%
    slice_head()
  nb_of_rows <- data[["rows"]]
  result <- get_data(data)

  expect_equal(nb_of_rows, nrow(result))
})

test_that("get_data work with datafiles input", {
  skip_on_cran()
  skip_if_offline()

  get_metadata()

  data <- datasets() %>%
    datafiles() %>%
    last_millesime() %>%
    arrange(rows) %>%
    slice_head()
  nb_of_rows <- data[["rows"]]
  result <- get_data(data %>% select(rid))

  expect_equal(nb_of_rows, nrow(result))
})


test_that("get_data fail", {
  expect_error(get_data(), "is mandatory")
  expect_error(get_data(c("a")), "must be a dataframe")
  expect_error(get_data(tibble(name = c(1, 2))), "must have an")
})
