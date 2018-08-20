library(shiny)
library(shinyCookie)

#' Define server logic required to generate a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyServer(function(input, output, session) {
  print(parseQueryString(session$request$HTTP_COOKIE))

  observeEvent(input$fire, {
    updateCookie(session, "mykey", "myvalue2")
  })

})
