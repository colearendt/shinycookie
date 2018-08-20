.global <- new.env()

initResourcePaths <- function() {
  if (is.null(.global$loaded)) {
    shiny::addResourcePath(
      prefix = 'shinyCookie',
      directoryPath = system.file('assets', package='shinyCookie'))
    .global$loaded <- TRUE
  }
  HTML("")
}
