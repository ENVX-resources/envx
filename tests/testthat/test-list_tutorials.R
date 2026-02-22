test_that("out-of-range tutorial produces a message, not an error", {
  mock_tutorials <- data.frame(
    name = c("tut01", "tut02"),
    title = c("Tutorial 1", "Tutorial 2"),
    package = c("envx", "envx"),
    stringsAsFactors = FALSE
  )
  mockery::stub(list_tutorials, "learnr::available_tutorials", mock_tutorials)
  mockery::stub(list_tutorials, "interactive", FALSE)

  expect_message(
    list_tutorials(99),
    "Tutorial 99 not found"
  )
})

test_that("non-numeric tutorial produces a message, not an error", {
  mock_tutorials <- data.frame(
    name = c("tut01", "tut02"),
    title = c("Tutorial 1", "Tutorial 2"),
    package = c("envx", "envx"),
    stringsAsFactors = FALSE
  )
  mockery::stub(list_tutorials, "learnr::available_tutorials", mock_tutorials)
  mockery::stub(list_tutorials, "interactive", FALSE)

  expect_message(
    list_tutorials("abc"),
    "Tutorial must be a number"
  )
})

test_that("non-interactive mode skips the menu", {
  mock_tutorials <- data.frame(
    name = c("tut01", "tut02"),
    title = c("Tutorial 1", "Tutorial 2"),
    package = c("envx", "envx"),
    stringsAsFactors = FALSE
  )
  mockery::stub(list_tutorials, "learnr::available_tutorials", mock_tutorials)
  mockery::stub(list_tutorials, "interactive", FALSE)

  # Should not call utils::menu at all
  menu_called <- FALSE
  mockery::stub(list_tutorials, "utils::menu", function(...) {
    menu_called <<- TRUE
    0L
  })

  result <- list_tutorials()
  expect_false(menu_called)
  expect_s3_class(result, "tbl_df")
})
