library(shiny)
library(shinyCookie)

#' Define UI for application that demonstrates a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyUI(function(req) {fluidPage(
    titlePanel("Shiny Cookie"),

    sidebarLayout(
        sidebarPanel(

          # initialize cookie js in UI
          initShinyCookie("cookies", "myapp"),

          tags$p("More information about shinyCookie"),
          textInput("value", "Enter a value to be stored"),
          actionButton("fire", "Fire!")
        ),

        mainPanel(
            shiny::verbatimTextOutput("shiny_cookie")
        )
    )
)})
