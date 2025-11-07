#' Calculate Figure Width Based on Output Width
#'
#' @description
#' Calculates the actual figure width in inches based on the percentage of
#' output width specified in knitr chunk options. The calculation assumes a
#' base width of 6 inches at 70% output width and scales proportionally.
#'
#' @param out.width Character string or numeric value representing the output
#'   width percentage. Defaults to the current knitr chunk's `out.width` option.
#'   Can be specified as a percentage (e.g., "70%") or numeric value.
#'
#' @return A numeric value representing the calculated figure width in inches.
#'
#' @details
#' The function uses the formula: `6 * (parsed_number / 70)` to scale the
#' figure width. For example:
#' - At 70% output width, returns 6 inches
#' - At 100% output width, returns approximately 8.57 inches
#' - At 50% output width, returns approximately 4.29 inches
#'
#' @examples
#' \dontrun{
#' # Using default chunk option
#' get_fig_width()
#'
#' # Specifying custom width
#' get_fig_width("50%")
#' get_fig_width(100)
#' }
#'
#' @export
#'
get_fig_width <- function(out.width = knitr::opts_chunk$get("out.width")) {
  6 * readr::parse_number(out.width) /  70
}
