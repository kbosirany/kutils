#' Parse date strings into Date objects
#'
#' This function attempts to parse character date strings using
#' lubridate::parse_date_time with a set of common orders. If a string cannot be
#' parsed it yields NA in the result.
#'
#' @param date_str [character] vector of date/time strings to parse.
#'
#' @return A [Date] vector corresponding to parsed input. Unparseable entries
#'   are returned as NA.
#'
#' @details The parsing orders tried (in no particular priority) are:
#'   "dmy", "mdy", "ymd", "Ymd", "dmY", "mdY", and "Ydm". Parsing is
#'   performed with exact = FALSE to allow flexible separators and
#'   variants supported by lubridate.
#'
#' @seealso lubridate::parse_date_time
#'
#' @examples
#' # Single string
#' as_date("01-02-2003")
#' # Vector of mixed formats
#' as_date(c("2003/02/01", "01 Mar 2004", "31-12-1999"))
#'
#' @export
#'
as_date <- function(x) {
  # formats to try (common day/month/year variants)
  formats <- c("dmy", "mdy", "ymd", "Ymd", "dmY", "mdY", "Ydm")
  # try parsing to POSIXct (lubridate handles many separators/variants)
  parsed <- lubridate::parse_date_time(x, orders = formats, exact = FALSE)
  # convert to Date (drop any time components)
  as.Date(parsed)
}
