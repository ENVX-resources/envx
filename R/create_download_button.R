#' Create a Download Button for Files in Learnr Tutorials
#'
#' This function creates a button-style download link for files in learnr tutorials.
#' It uses base64 encoding to embed the file content directly in the HTML output,
#' ensuring reliable downloads without external dependencies.
#'
#' @param file_path Character string. Path to the file to be downloaded.
#' @param button_label Character string. Label for the download button. If NULL,
#'   uses the filename.
#' @param button_class Character string. CSS class for styling the button.
#'   Defaults to "btn btn-danger".
#' @param icon Character string. Font Awesome icon class. Set to NULL for no icon.
#'   Defaults to "fa fa-download".
#' @param icon_margin Character string. CSS margin for the icon.
#'   Defaults to "margin-right: 5px;".
#'
#' @return An HTML tag object that creates a download button.
#'
#' @examples
#' \dontrun{
#' # Basic usage with default settings
#' create_download_button("data.xlsx")
#'
#' # Customized button
#' create_download_button(
#'   "data.xlsx",
#'   button_label = "Download Excel File",
#'   button_class = "btn btn-primary",
#'   icon = "fa fa-file-excel"
#' )
#' }
#'
#' @importFrom base64enc base64encode
#' @importFrom htmltools tags
#' @export
create_download_button <- function(file_path,
                                   button_label = NULL,
                                   button_class = "btn btn-danger",
                                   icon = "fa fa-download",
                                   icon_margin = "margin-right: 5px;") {
  # Input validation
  if (!file.exists(file_path)) {
    stop("File not found: ", file_path)
  }

  # Get filename for download attribute
  filename <- basename(file_path)

  # Set button label if not provided
  if (is.null(button_label)) {
    button_label <- filename
  }

  # Read and encode file
  file_raw <- readBin(file_path, "raw", file.info(file_path)$size)
  file_b64 <- base64enc::base64encode(file_raw)

  # Determine MIME type based on file extension
  mime_type <- switch(tools::file_ext(filename),
    "xlsx" = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "xls" = "application/vnd.ms-excel",
    "csv" = "text/csv",
    "txt" = "text/plain",
    "pdf" = "application/pdf",
    "zip" = "application/zip",
    "application/octet-stream" # default mime type
  )

  # Create the download link
  download_link <- htmltools::tags$a(
    href = sprintf("data:%s;base64,%s", mime_type, file_b64),
    download = filename,
    class = button_class,
    if (!is.null(icon)) {
      htmltools::tags$i(class = icon, style = icon_margin)
    },
    button_label
  )

  return(download_link)
}
