#' List available tutorials and optionally open a specific tutorial
#'
#' @param tutorial Optional numeric value indicating which tutorial to open
#' @return Invisibly returns a data frame of available tutorials
#' @importFrom learnr available_tutorials run_tutorial
#' @importFrom tibble tibble
#' @importFrom purrr map2 walk
#' @export
#'
#' @examples
#' # List all available tutorials
#' list_tutorials()
#'
#' # Open tutorial number 2 directly
#' list_tutorials(2)
list_tutorials <- function(tutorial = NULL) {
  # get the list of tutorials
  tutorials <- learnr::available_tutorials("envx")
  tut_df <- tibble::tibble(tutorials)

  # Create formatted list with index, name, and title
  tut_list <- purrr::map2(
    seq_along(tut_df$name),
    tut_df$name,
    ~ paste0(.x, ": ", .y)
  )
  tut_list <- purrr::map2(
    tut_list,
    tut_df$title,
    ~ paste0(.x, " - ", .y)
  )

  # Print the formatted list
  purrr::walk(tut_list, ~ cat(.x, "\n"))

  # If tutorial number provided, validate and run it
  if (!is.null(tutorial)) {
    if (!is.numeric(tutorial)) {
      stop("Tutorial must be a numeric value")
    }
    if (tutorial < 1 || tutorial > nrow(tut_df)) {
      stop("Tutorial number out of range")
    }
    learnr::run_tutorial(tut_df$name[tutorial], "envx")
  }

  # Return the tutorial data frame invisibly
  invisible(tut_df)
}
