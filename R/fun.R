# This is test

# this is another test
# test of branch for color change.

#' Create a report for exploratory data analysis (EDA)
#'
#' This function generates a comprehensive EDA report and attempts to open it in a browser.
#'
#' @param df A data.frame or a matrix with at least 2 columns.
#' @param target A selected target variable.
#' @examples
#' # Example with default parameters (using iris dataset)
#' eda(iris)
#'
#' # Example with a target variable
#' eda(iris, "Species")
#'
#' # Example with custom data frame and target variable
#' my_data <- data.frame(x = rnorm(100), y = rnorm(100))
#' eda(df = my_data, target = "x")
#'
#' @details
#' The function performs a check on the input data to ensure it is either a data frame or matrix.
#' It also checks that the input data has at least two columns. The function uses a predefined Rmarkdown template (`eda.Rmd`)
#' to generate the report. This template should be present in the `inspect` package.
#'
#' @seealso
#' \code{\link[rmarkdown]{render}} for details on the rendering of Rmarkdown documents.
#' \code{\link[utils]{browseURL}} for how URLs or files are opened in browsers.
#'
#' @return This function does not return a value. Instead, it generates an HTML file containing the EDA report and attempts to open this file in the default web browser.
#' @export
eda <- function(df, target = NULL) {
  # Validate input
  if(is.null(df)) {
    stop("No data frame provided.")
  }
  if(!is.data.frame(df) && !is.matrix(df)) {
    stop("The provided data is neither a data frame nor a matrix.")
  }
  if(ncol(df) < 2) {
    stop("The data frame/matrix should have at least two columns.")
  }

  # Define file paths
  rmd_file <- "inspect_EDA.Rmd"
  output_file <- "inspect_EDA_report.html"

  # Copy the Rmd file template
  file.copy(from = system.file("eda.Rmd", package = "inspect"), to = rmd_file, overwrite = TRUE)

  # Set up parameters to pass to the Rmd document
  params <- list(df = df, target = target)

  # Render the Rmarkdown document
  tryCatch({
    rmarkdown::render(input = rmd_file, output_file = output_file, params = params, envir = new.env(parent = globalenv()))
    # Attempt to open the HTML report in a browser
    utils::browseURL(output_file)
  }, error = function(e) {
    cat("Error when generating the report: ", e$message, "\n")
  }, finally = {
    cat("Report generation process completed.\n")
  })
}





