#' Update Cookie
#'
#' Sets / updates a cookie's value in the browser.
#' Serialization is handled by default (in `jsonlite`?).
#'
#' @param session The Shiny session variable
#' @param name The name of the cookie to update
#' @param value The value to assign to the cookie
#'
#' @return NULL
#'
#' @export
updateCookie <- function(session, name, value) {
  if (missing(session) || missing(name) || missing(value)) {
    stop("Must provide a session, a name, and a value")
  }

  li <- list()

  li[[name]] <- value

  session$sendCustomMessage("shinyCookie", li)

  invisible()
}
