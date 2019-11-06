context("initShinyCookie")

test_that("fails without an id", {
  expect_error(
    initShinyCookie(),
    "Must provide an `id` when init"
  )
})

test_that("returns html", {
  res <- initShinyCookie("test")

  expect_s3_class(res, "shiny.tag.list")
})
