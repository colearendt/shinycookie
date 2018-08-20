library(shiny)
library(shinyCookie)

#' Define UI for application that demonstrates a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyUI(fluidPage(

    titlePanel("Shiny Cookie"),

    sidebarLayout(
        sidebarPanel(
          initShinyCookie("myid", "myapp"),
          tags$p("More information about shinyCookie"),
          actionButton("fire", "Fire!")
        ),

        mainPanel(
        )
    )
))
