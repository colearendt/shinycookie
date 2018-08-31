library(shiny)
library(shinycookie)

#' Define UI for application that demonstrates a simple shinyCookie example
#' @author Cole Arendt \email{cole@@rstudio.com}
shinyUI(function(req) {fluidPage(
    titlePanel("Shiny Cookie"),

    sidebarLayout(
        sidebarPanel(
          initShinyCookie("myid"),
          tags$p("More information about shinyCookie"),
          actionButton("fire", "Fire!")
        ),

        mainPanel(
            shiny::verbatimTextOutput("ui_based_cookie")
            , shiny::verbatimTextOutput("shinyCookie_cookie")
            , shiny::verbatimTextOutput("shiny_cookie")
            ,HTML(paste0("<script>Shiny.setInputValue('cookies', '",req$HTTP_COOKIE, "')</script>"))
        )
    )
)})
