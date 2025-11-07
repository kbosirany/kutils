#' @export
#'
build_site <- function() {
  fairify::build_site(
    clean_cache = TRUE,
    allow_duplicate_labels = TRUE,
    output_format = Sys.getenv("BOOKDOWN_FORMAT", "bookdown::gitbook")
  )
}
