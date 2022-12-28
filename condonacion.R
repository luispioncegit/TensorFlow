#######################CALCULADORA CONDONACION#########################
library(shinyWidgets)
library(shinydashboard)
library(shinyjs)




ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(collapsed = TRUE),
  dashboardBody(
    fluidRow(
    box(
      title = "DEUDA TOTAL", 
      solidHeader = TRUE, 
      status = "primary", 
      width = 4, 
      currencyInput("deuda", label = NULL, value = 1000, format = "dollar")
    ),
    
    box(
      title = "MORA TOTAL", 
      solidHeader = TRUE, 
      status = "danger", 
      width = 4, 
      currencyInput("mora", label = NULL, value = 100, format = "dollar")
    ),
    
    box(
      title = "PORCENTAJE NEGOCIACIÓN", 
      solidHeader = TRUE, 
      status = "warning", 
      width = 3, 
      currencyInput("perc", label = NULL, value = 0.1, format = "percentageUS2dec")
    ),
    ),
    
    fluidRow(
    box(
      title = "TOTAL CONDONACIÓN", 
      solidHeader = TRUE, 
      status = "info", 
      width = 4, 
      textOutput("TOTAL_CON", container = div, inline = FALSE)
    ),
    
    box(
      title = "TOTAL A COBRAR", 
      solidHeader = TRUE, 
      status = "success", 
      width = 4, 
      textOutput("TOTAL_COBRO", container = div, inline = FALSE)
    )
    ),
  )
  
  
)


server<-function(input,output){
  output$TOTAL_CON <- renderText(expr = input$mora * input$perc)
  
  
  output$TOTAL_COBRO <- renderText(expr = input$deuda - input$mora * input$perc)
  
}

shinyApp(ui = ui, server = server)
