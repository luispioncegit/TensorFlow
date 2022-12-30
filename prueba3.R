library(shiny)
library(DT)
library(ggplot2)
library(shinyWidgets)
library(shinyjs)


ui = fluidPage(
  fluidRow(
    column(12,div(style = "height:200px;background-color: black;", "Topleft")),
  ),
  fluidRow(class = "myRow1", 
           column(3, 
                  fluidRow(div(style = "height:100px;background-color: yellow;", "Topleft")),
                  fluidRow(div(style = "height:100px;background-color: blue;", "Topright")),
                  fluidRow(div(style = "height:100px;background-color: magenta;", "Topright"))
           ),
           column(3, 
                  div(style = "height:100px;background-color: green; margin:0%", "Topleft"),
           
           ),
           column(3, 
                  div(style = "height:100px;background-color: green;margin:0%", "Topleft"),
                  
           )
  ),
  fluidRow(class = "myRow2",
           column(12,div(style = "height:100px;background-color: red;text-align: center;", "Bottomleft")),
           
)
)

server = function(input, output) {
}

shinyApp(ui, server)