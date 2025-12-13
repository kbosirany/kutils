#' @export
#'
in_ci <- function() {
  env <- Sys.getenv
  any(nzchar(c(
    env("CI"),
    env("GITHUB_ACTIONS"),
    env("GITLAB_CI"),
    env("TRAVIS"),
    env("CIRCLECI"),
    env("APPVEYOR"),
    env("BUILDKITE"),
    env("BITBUCKET_BUILD_NUMBER"),
    env("TEAMCITY_VERSION"),
    env("DRONE"),
    env("JENKINS_URL"),
    env("AZURE_HTTP_USER_AGENT")
  )))
}
