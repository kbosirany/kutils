#' @export
#'
in_docker <- function() {
  # Check for /.dockerenv file
  if (file.exists("/.dockerenv")) {
    return(TRUE)
  }

  # Check cgroup for docker
  tryCatch({
    cgroup_content <- readLines("/proc/self/cgroup", warn = FALSE)
    if (any(grepl("docker|kubepods", cgroup_content, ignore.case = TRUE))) {
      return(TRUE)
    }
  }, error = function(e) FALSE)

  return(FALSE)
}
