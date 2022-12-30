library(shiny)
library(DT)
library(ggplot2)
library(shinyWidgets)
library(shinyjs)



ui <- fluidPage(
  fluidRow(column(2,),
           column(8, div(h1(strong("CALCULADORA DE NEGOCIACIÓN")), style = "text-align: center;")),
           column(2, div(img(src='Logo_Recycob.png', height = '50px', width = '200px'), style = "text-align: right;"))),
        fluidRow(
          column(3,
            fluidRow(column(10, currencyInput("deuda", label = h3("DEUDA TOTAL"), value = 1000, format = "dollar"))),
            fluidRow(column(10, currencyInput("mora", label = h3("MORA TOTAL"), value = 100, format = "dollar"))),
            fluidRow(column(10, h3(HTML("<p style='font-size: 22px; color: black'>PORCENTAJE NEGOCIACIÓN</p>")), span(sliderInput("perc", label = NULL, min = 0, max = 20, step = 0.5, post  = " %", value = 10), style="font-size: 25px; color: red"))),
          ),
          
          column(4, 
            div(style = "font-size: 10px;padding: 350px 0px;margin:0%", fluidRow(column(11, h3(HTML("<p style='font-size: 30px; color: black'>TOTAL CONDONACIÓN</p>")), span(textOutput("total_con", container = div, inline = FALSE))),style="font-size: 42px; color: black"),)),
                              
                           
          column(3, 
            div(style = "font-size: 10px;padding: 350px 0px;margin:0%", fluidRow(column(11, h3(HTML("<p style='font-size: 30px; color: black'>TOTAL A COBRAR</p>")), span(textOutput("total_cobro", container = div, inline = FALSE))),style="font-size: 42px; color: green"),)),
                                  
                                  
          column(2,
            fluidRow(column(12, h3(HTML("<p style='font-size: 30px; color: black'>MONTO MÁXIMO DE CONDONACIÓN</p>")), span(textOutput("max", container = div, inline = FALSE))), style="font-size: 42px; color: red"))
        ),
  )



server <- function(input, output) {
  output$max <- renderText({paste("$", format(round(input$mora * 0.2, 2), nsmall=1, big.mark=","))})
  
  
  output$total_con <- renderText({paste("$", format(round(input$mora * input$perc / 100, 2), nsmall=1, big.mark=","))})
  
  
  output$total_cobro <- renderText({paste("$", format(round(input$deuda - input$mora * input$perc / 100, 2), nsmall=1, big.mark=","))})
}
shinyApp(ui, server)
