#' @export
#'
rename_from_metadata <- function(x, ...) {
  UseMethod("rename_from_metadata", x)
}

#' @export
#' @rdname rename_from_metadata
#'
rename_from_metadata.data.frame <- function(x, metadata, which, vars, ...) {
  switch(
    which,
    vars = {
      metadata <- filter(metadata, !is.na(new_label))
      if (nrow(metadata) > 0) {
        new_label <- setNames(metadata$new_label, metadata$label)
        x <- x %>%
          rename_with(
            ~ new_label[.] %||% .,
            .cols = names(new_label)[names(new_label) %in% names(x)]
          )
      }
    },
    values = {
      for (v in names(metadata)) {
        m <- filter(metadata[[v]], !is.na(new_label))
        if (nrow(m) > 0) {
          new_label <- setNames(m$new_label, m$label)
          x <- mutate(x, !!sym(sprintf("%s_old", v)) := !!sym(v)) %>%
            mutate_at(v, ~ ifelse(. %in% names(new_label), new_label[.], .))
        }
      }
    }
  )
  return(x)
}