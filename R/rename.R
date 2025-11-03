#' @export
#'
rename.data.frame <- function(.data, ..., metadata, which, vars)  {
  if (missing(metadata)) return(dplyr::rename(.data, ...))
  x <- .data
  switch(
    which,
    vars = {
      metadata <- filter(metadata, !is.na(new_label))
      if (nrow(metadata) > 0) {
        new_label <- setNames(metadata$new_label, metadata$label)
        x <- rename_with(x, ~ new_label[.] %||% ., .cols = names(new_label))
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
