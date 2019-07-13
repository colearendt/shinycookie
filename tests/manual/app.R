library(shiny)
library(shinycookie)

obj_list <- list(
  integer = 1L,
  numeric = 1,
  numeric_decimal = 1.234,
  character = '"some-text"',
  vector_character = c("a", "b", "c"),
  vector_numeric = c(1,2,3),
  vector_numeric_decimal = c(1.2, 2.2, 3.2),
  data_frame = data.frame(a = c("a","b","c"), b = c(4,5,6))
)
  ui <- fluidPage(
      initShinyCookie("cookie"),
      titlePanel("shinycookie Test App"),

      fluidPage(
        h2(textOutput("label")),
        uiOutput("cookie_text")
      )
  )

  server <- function(input, output, session) {

      bump <- reactiveVal(TRUE)

      output$cookie_text <- renderUI({
        req(input$cookie)
         htmltools::HTML(paste(capture.output(str(purrr::map(input$cookie, ~ jsonlite::fromJSON(.x)))), collapse="<br>"))
      })

      output$label <- renderText({
        if (!bump()) {
          "SET"
        } else {
          "UNSET"
        }
      })

      observe({
        message("firing...")

        if (isolate(bump())) {
          # set values
          updateCookie(session = session, !!!obj_list)
          isolate(bump(FALSE))
          invalidateLater(10000, session)
        } else {
          # unset values
          updateCookie(session = session, !!!rlang::set_names(rep(NA, length(obj_list)), names(obj_list)))
          isolate(bump(TRUE))
          invalidateLater(1000, session)
        }
      })

  }
  shinyApp(ui = ui, server = server)

#build_app(1)
#build_app(1.2)
#build_app("some-text")
#build_app(c("one","two","three"))
#build_app(c(1,2,3))
#build_app(c(1.2,2.2,3.2))
#build_app(data.frame(a=c("1","2","3"), b=c(4,5,6), c=c(1.2,2.2,3.2)))
