#' Remove Cookie
#'
#' @param name The name of the cookie to remove
#' @param ... name=value pairs used as attributes to specify the cookie to be deleted
#' @param session The shiny session
#'
#' @return NULL
#'
#' @export
removeCookie <- function(name, ..., session = shiny::getDefaultReactiveDomain()) {
  # to match defaults in shinyCookie.js for creating a new cookie
  defaults <- list(path = "")
  li <- c(rlang::list2(...))

  final_list <- c(list(name = name), purrr::list_modify(defaults, !!!li))

  session$sendCustomMessage("shinyCookieRemove", final_list)

  invisible()
}
