#' List available tutorials and open if asked
#'
#' @return A list of available tutorials, and opens the selected tutorial if
#'   requested
#' @importFrom learnr available_tutorials run_tutorial
#' @importFrom tibble tibble
#' @importFrom purrr map2 walk
#' @export
#'
#' @examples
list_tutorials <- function() {
  # get the list of tutorials
  tutorials <- learnr::available_tutorials("envx")
  tut_df <- tibble::tibble(tutorials)
  # Create a new list with the index, name, and title
  tut_list <- purrr::map2(seq_along(tut_df$name), tut_df$name, ~ paste0(.x, ": ", .y))
  # Add the title to the list
  tut_list <- purrr:::map2(tut_list, tut_df$title, ~ paste0(.x, " - ", .y))
  purrr::walk(tut_list, ~ cat(.x, "\n"))
  cat("\n")
  cat("Do you want to open a tutorial? (y/n): ")
  open <- readline()
  if (open == "y") {
    cat("Which tutorial do you want to open? (type the number): \n")
    # Print the list with each element on a new line
    tut_num <- as.numeric(readline())
    learnr::run_tutorial(tut_df$name[tut_num], "envx")
  }
}
