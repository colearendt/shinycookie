#' Initialize shinyCookie in an applicatoin's UI
#'
#' This initializes the shinyCookie object in the
#' UI of the Shiny application. It should be placed
#' within the UI of the Shiny application before any
#' other `shinyCookie` functions are called.
#'
#' @param id The identifier that will be used to reference cookies from the server as input$id
#' @param timeout The length of time (in milliseconds) to poll for changes to cookies
#'
#' @return NULL
#'
#' @export
initShinyCookie <- function(id, timeout = 500) {
  if (missing(id)){
    stop("Must provide an `id` when initializing the shinyCookie package")
  }


  tagList(
    htmltools::htmlDependency(
      name = "shinyCookie",
      version = packageVersion("shinycookie"),
      src = "www",
      package = "shinycookie",
      script = c("js.cookie.js","shinyCookie.js")
    ),
    HTML(
      paste0(
        "<script type=\"text/javascript\">shinycookie.init(",
        timeout,
        ")</script>")
      ),
    span(class="shiny-cookie", id=id)
  )
}
