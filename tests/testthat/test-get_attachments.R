get_metadata()

test_that("check get_attachments", {
  skip_on_cran()
  skip_if_offline()
  urls <- datasets() %>% attachments() %>% select(url) %>% slice(1)

  expect_message(get_attachments(urls), "downloaded", dest = tempdir())
})
