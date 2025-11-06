#' @inherit kmetadata::load_metadata
#' @export
#'
load_metadata <- function(
  x, path, which, vars, force = FALSE, simplify = TRUE, ...
) {
  kmetadata::load_metadata(
    x = x,
    path = path,
    which = which,
    vars = vars,
    force = force,
    simplify = simplify,
    ...
  )
}
