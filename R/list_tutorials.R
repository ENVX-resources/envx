#' List available tutorials and optionally open a specific tutorial
#'
#' When called without arguments in an interactive session, displays a
#' numbered list of tutorials and presents a menu for selection. A tutorial
#' number can also be passed directly to skip the menu.
#'
#' @param tutorial Optional numeric value indicating which tutorial to open
#' @return Invisibly returns a data frame of available tutorials
#' @importFrom learnr available_tutorials run_tutorial
#' @importFrom tibble tibble
#' @importFrom purrr walk
#' @export
#'
#' @examples
#' \dontrun{
#' # List all available tutorials
#' list_tutorials()
#'
#' # Open tutorial number 2 directly
#' list_tutorials(2)
#' }
list_tutorials <- function(tutorial = NULL) {
  # get the list of tutorials
  tutorials <- learnr::available_tutorials("envx")
  tut_df <- tibble::tibble(tutorials)

  # Menu choices formatted as "name - title"
  choices <- paste0(tut_df$name, " - ", tut_df$title)

  # If tutorial number provided, validate and run it
  if (!is.null(tutorial)) {
    if (!is.numeric(tutorial)) {
      message("Tutorial must be a number.")
    } else if (tutorial < 1 || tutorial > nrow(tut_df)) {
      message("Tutorial ", tutorial, " not found.")
    } else {
      learnr::run_tutorial(tut_df$name[tutorial], "envx")
      return(invisible(tut_df))
    }
  }

  # Interactive menu when no valid tutorial was provided
  if (interactive()) {
    selection <- utils::menu(choices,
      title = "Select a tutorial (or 0 to cancel):")
    if (selection > 0) {
      learnr::run_tutorial(tut_df$name[selection], "envx")
    }
  } else {
    # Non-interactive: just print the list
    purrr::walk(
      paste0(seq_along(choices), ": ", choices),
      ~ cat(.x, "\n")
    )
  }

  invisible(tut_df)
}
