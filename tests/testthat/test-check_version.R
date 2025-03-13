test_that("check_version works as expected", {
  # Mock the httr2 request and response
  mockery::stub(
    check_version,
    "httr2::request",
    function(...) {
      structure(
        list(
          url = "https://api.github.com/repos/januarharianto/envx/contents/DESCRIPTION"
        ),
        class = "httr2_request"
      )
    }
  )

  mockery::stub(
    check_version,
    "httr2::req_headers",
    function(req, ...) req
  )

  # Test with a newer version available
  mockery::stub(
    check_version,
    "httr2::req_perform",
    function(...) {
      structure(
        list(
          body = charToRaw(paste0(
            "Package: envx\n",
            "Version: 99.0.0\n",
            "Title: Test package"
          ))
        ),
        class = "httr2_response"
      )
    }
  )

  mockery::stub(
    check_version,
    "httr2::resp_body_string",
    function(...) {
      paste0(
        "Package: envx\n",
        "Version: 99.0.0\n",
        "Title: Test package"
      )
    }
  )

  # Capture the message about newer version
  expect_message(
    check_version(),
    "A newer version \\(99\\.0\\.0\\) is available on GitHub"
  )

  # Test error handling with failed request
  mockery::stub(
    check_version,
    "httr2::req_perform",
    function(...) stop("API request failed")
  )

  expect_message(
    check_version(),
    "Could not check for updates: API request failed"
  )
})
