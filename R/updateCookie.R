#' Update Cookie
#'
updateCookie <- function(session, name, value) {
  if (missing(session) || missing(name) || missing(value)) {
    stop("Must provide a session, a name, and a value")
  }

  li <- list()

  li[[name]] <- list(data = value)

  session$sendCustomMessage("shinyCookie", li)
}
