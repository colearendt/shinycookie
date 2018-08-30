library(shiny)
library(shinyCookie)

#' Define server logic required to generate a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyServer(function(input, output, session) {
  print(parseQueryString(session$request$HTTP_COOKIE))

  observeEvent(input$fire, {
    updateCookie(session, "mykey", Sys.time())
  })

  output$ui_based_cookie <- renderText({paste0("UI: ",input$cookies)})
  output$shiny_cookie <- renderText(session$request$HTTP_COOKIE)
  output$shinyCookie_cookie <- renderText({
    paste0("shinyCookie: ",
           paste(capture.output(str(input$myid)), collapse=" ")
    )
  })
})
