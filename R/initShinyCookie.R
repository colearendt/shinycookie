#' Initialize shinyCookie in an applicatoin's UI
#'
#' @export
initShinyCookie <- function(id, namespace) {
  if (missing(id) || missing(namespace)){
    stop("Must provide an ID and a namespace when initializing the shinyCookie package")
  }

  tagList(
    singleton(tags$head(
      initResourcePaths(),
      tags$script(src = 'shinyCookie/js.cookie.js'),
      tags$script(src = 'shinyCookie/shinyCookie.js')
    )),
    HTML(paste0("<script type=\"text/javascript\">shinyCookie.init('",namespace,"')</script>")),
    div(class="shiny-cookie", id=id)
  )
}
