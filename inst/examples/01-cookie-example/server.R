library(shiny)
library(shinycookie)

#' Define server logic required to generate a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyServer(function(input, output, session) {

  # set value of cookies
  observeEvent(input$fire, {
    updateCookie(session, "time"=Sys.time())
    updateCookie(session, "another_val"=input$value)
    updateCookie(session, !!!list(one="blah", two = "hi"))
  })

  # remove a cookie
  observeEvent(input$remove, {
    removeCookie(name = "time")
    removeCookie("another_val")
    removeCookie("one")
    removeCookie("two")
  })

  # render value of cookies
  output$shiny_cookie <- renderText({
    paste0("shinyCookie: ",
           paste(capture.output(str(input$cookies)), collapse="\n")
    )
  })
})
