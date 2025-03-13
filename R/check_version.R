#' Check for newer version on GitHub
#'
#' Checks if a newer version of the envx package is available on GitHub by comparing
#' the local version with the version in the main branch of the GitHub repository.
#'
#' @return A message indicating if an update is available or if the current version
#'   is up to date. Returns NULL if version check fails.
#' @export
#'
#' @examples
#' \dontrun{
#' check_version()
#' }
check_version <- function() {
  # Get local version
  local_version <- utils::packageVersion("envx")

  tryCatch(
    {
      # Use httr2 for API request
      resp <- httr2::request("https://api.github.com/repos/ENVX-resources/envx/contents/DESCRIPTION") |>
        httr2::req_headers(
          Accept = "application/vnd.github.v3.raw",
          `X-GitHub-Api-Version` = "2022-11-28"
        ) |>
        httr2::req_perform()

      # Extract content and parse DESCRIPTION
      desc_content <- httr2::resp_body_string(resp)
      desc_lines <- strsplit(desc_content, "\n")[[1]]
      version_line <- grep("^Version:", desc_lines, value = TRUE)
      github_version <- gsub("Version:\\s*", "", version_line)

      # Compare versions
      if (utils::compareVersion(github_version, as.character(local_version)) > 0) {
        message(
          "A newer version (", github_version, ") is available on GitHub.\n",
          "You are currently using version ", local_version, ".\n",
          "Use `remotes::install_github('januarharianto/envx')` to update."
        )
      } else {
        message("Your version (", local_version, ") is up to date.")
      }
    },
    error = function(e) {
      message("Could not check for updates: ", e$message)
      return(NULL)
    }
  )
}
