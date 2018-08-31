#' Update Cookie
#'
#' Sets / updates a cookie's value in the browser.
#' Serialization is handled by default (in `jsonlite`?).
#'
#' @param session The Shiny session variable
#' @param ... name=value pairs to be used in setting cookie values
#'
#' @return NULL
#'
#' @export
updateCookie <- function(session, ...) {
  if (missing(session)) {
    stop("Must provide a session, a name, and a value")
  }

  li <- rlang::list2(...)

  session$sendCustomMessage("shinyCookie", li)

  invisible()
}
