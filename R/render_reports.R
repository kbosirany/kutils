#' @export
#'
render_reports <- function() {
  fairify::render_reports(clean_cache = TRUE, allow_duplicate_labels = TRUE)
}
