library(shiny)
library(shinyCookie)

#' Define server logic required to generate a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyServer(function(input, output, session) {
  print(parseQueryString(session$request$HTTP_COOKIE))

  observeEvent(input$fire, {
    updateCookie(session, "time", Sys.time())
    updateCookie(session, "another_val", input$value)
  })

  output$shiny_cookie <- renderText({
    paste0("shinyCookie: ",
           paste(capture.output(str(input$myid)), collapse="\n")
    )
  })
})
