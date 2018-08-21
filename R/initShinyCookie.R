#' Initialize shinyCookie in an applicatoin's UI
#'
#' @export
initShinyCookie <- function(id, namespace, timeout = 500) {
  if (missing(id) || missing(namespace)){
    stop("Must provide an ID and a namespace when initializing the shinyCookie package")
  }


  tagList(
    htmltools::htmlDependency(
      name = "shinyCookie",
      version = packageVersion("shinyCookie"),
      src = "www",
      package = "shinyCookie",
      script = c("js.cookie.js","shinyCookie.js")
    ),
    HTML(
      paste0(
        "<script type=\"text/javascript\">shinyCookie.init('",
        namespace,
        "', ",
        timeout,
        ")</script>")
      ),
    span(class="shiny-cookie", id=id)
  )
}
