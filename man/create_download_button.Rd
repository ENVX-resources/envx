% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_download_button.R
\name{create_download_button}
\alias{create_download_button}
\title{Create a Download Button for Files in Learnr Tutorials}
\usage{
create_download_button(
  file_path,
  button_label = NULL,
  button_class = "btn btn-danger",
  icon = "fa fa-download",
  icon_margin = "margin-right: 5px;"
)
}
\arguments{
\item{file_path}{Character string. Path to the file to be downloaded.}

\item{button_label}{Character string. Label for the download button. If NULL,
uses the filename.}

\item{button_class}{Character string. CSS class for styling the button.
Defaults to "btn btn-danger".}

\item{icon}{Character string. Font Awesome icon class. Set to NULL for no icon.
Defaults to "fa fa-download".}

\item{icon_margin}{Character string. CSS margin for the icon.
Defaults to "margin-right: 5px;".}
}
\value{
An HTML tag object that creates a download button.
}
\description{
This function creates a button-style download link for files in learnr tutorials.
It uses base64 encoding to embed the file content directly in the HTML output,
ensuring reliable downloads without external dependencies.
}
\examples{
\dontrun{
# Basic usage with default settings
create_download_button("data.xlsx")

# Customized button
create_download_button(
  "data.xlsx",
  button_label = "Download Excel File",
  button_class = "btn btn-primary",
  icon = "fa fa-file-excel"
)
}

}
