#' Custom learnr download button
#'
#' @param df a data frame object
#' @param filename name of the file -- include the ".csv" in the name
#' @param buttonLabel label of the button
#' @import htmltools
#' @import jsonlite
#'
#' @returns a button
#' @export
download_button <- function(df, filename = "data.csv", buttonLabel = "Download CSV") {
  # Create a unique ID
  btn_id <- paste0("btn_", sample(1000:9999, 1))

  # Convert dataframe to JSON in row-oriented format
  json_data <- toJSON(
    lapply(1:nrow(df), function(i) {
      as.list(df[i,])
    })
  )

  # Create JavaScript for handling the download
  js <- sprintf(
    "
    document.getElementById('%s').addEventListener('click', function() {
      // Parse the data
      const rows = %s;

      // Get column names (from first row)
      const columns = Object.keys(rows[0]);

      // Build CSV string
      let csv = columns.join(',') + '\\n';

      // Add each row
      rows.forEach(row => {
        let rowStr = columns.map(col => {
          let value = row[col];
          // Handle strings with commas or quotes
          if (typeof value === 'string' && (value.includes(',') || value.includes('\"'))) {
            return '\"' + value.replace(/\"/g, '\"\"') + '\"';
          }
          return value;
        }).join(',');
        csv += rowStr + '\\n';
      });

      // Create and trigger download
      const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
      const link = document.createElement('a');
      link.href = URL.createObjectURL(blob);
      link.setAttribute('download', '%s');
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    });
    ",
    btn_id, json_data, filename
  )

  # Combine into a single HTML output
  tagList(
    tags$button(
      id = btn_id,
      class = "btn btn-success",
      style = "padding: 8px 16px; cursor: pointer;",
      buttonLabel
    ),
    tags$script(HTML(js))
  )
}
