#' @export
#'
kmerge <- function(x, y, ...) {
  UseMethod("kmerge")
}

#' @export
#' @rdname kmerge
#'
kmerge.data.frame <- function(x, y, ...) {
  browser()
}

#' @export
#' @rdname kmerge
#'
kmerge.list <- function(x, y, ...) {
  browser()
}
