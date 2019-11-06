library(shiny)
build_app <- function(value){

  ui <- fluidPage(
      initShinyCookie("cookie"),
      titlePanel("shinycookie Test App"),

      fluidPage(
          textOutput("cookie_text")
      )
  )

  server <- function(input, output, session) {

      output$cookie_text <- renderText({
          paste0("shinyCookie: ",
             paste(capture.output(str(input$cookie$test)), collapse=" ")
          )
      })

      updateCookie(session = session, test = value)

  }
  shinyApp(ui = ui, server = server)
}

build_app(1)
build_app(1.2)
build_app("some-text")
build_app(c("one","two","three"))
build_app(c(1,2,3))
build_app(c(1.2,2.2,3.2))
build_app(data.frame(a=c("1","2","3"), b=c(4,5,6), c=c(1.2,2.2,3.2)))
