#' Initialize shinyCookie in an applicatoin's UI
#'
#' @export
initShinyCookie <- function(id, namespace) {
  if (missing(id) || missing(namespace)){
    stop("Must provide an ID and a namespace when initializing the shinyCookie package")
  }

  htmltools::htmlDependency(
    name = "shinyCookie",
    version = packageVersion("shinyCookie"),
    src = "assets",
    script = c("js.cookie.js","shinyCookie.js")
  )

  tagList(
    singleton(tags$head(
      initResourcePaths()
      #tags$script(src = 'shinyCookie/js.cookie.js'),
      #tags$script(src = 'shinyCookie/shinyCookie.js')
    )),
    HTML(paste0("<script type=\"text/javascript\">shinyCookie.init('",namespace,"')</script>")),
    div(class="shiny-cookie", id=id)
  )
}
