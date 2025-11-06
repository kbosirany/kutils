#' @export
#'
kable <- function(
  x,
  is_html_output = knitr::is_html_output() || interactive(),
  title = NULL,
  height = "100%"
) {
  if (is_html_output) {
    kableExtra::kable(x, format = "pipe", caption = title) %>%
      kableExtra::kable_styling(font_size = 12) %>%
      kableExtra::column_spec(1:ncol(x), width = "auto") %>%
      kableExtra::scroll_box(width = "100%", height = height)
  } else {
    knitr::kable(head(x), format = "latex", booktabs = TRUE, caption = title)
  }
}
