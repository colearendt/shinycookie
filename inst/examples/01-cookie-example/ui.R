library(shiny)
library(shinyCookie)

#' Define UI for application that demonstrates a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyUI(function(req) {fluidPage(
    HTML(paste0("<script>Shiny.setInputValue('cookies', '",req$HTTP_COOKIE, "')</script>")),
    titlePanel("Shiny Cookie"),

    sidebarLayout(
        sidebarPanel(
          initShinyCookie("myid", "myapp"),
          tags$p("More information about shinyCookie"),
          actionButton("fire", "Fire!")
        ),

        mainPanel(
            shiny::verbatimTextOutput("ui_based_cookie")
            , shiny::verbatimTextOutput("my_cookie")
            , shiny::verbatimTextOutput("shiny_cookie")
        )
    )
)})
