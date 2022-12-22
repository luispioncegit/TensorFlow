library(shiny)
library(tidyverse)

#####Import Data




dat<-read_csv(url("https://www.dropbox.com/s/uhfstf6g36ghxwp/cces_sample_coursera.csv?raw=1"))
dat<- dat %>% select(c("pid7","ideo5"))
dat<-drop_na(dat)

ui <- fluidPage(
  
  h1("Histograma"),
  p("Este es un gráfico de la distribución de partido electoral en función de ideología"),
  
  # Sidebar with a slider input for number of bins 
  
  sliderInput("values",
              "Select Five Point Ideology (1=Very liberal, 5=Very conservative)",
              min = 1,
              max = 5,
              value = 3),
  
  
  
  plotOutput("distPlot"),
  h1("Tabla"),
  selectInput(inputId = "checkbox", label = "cual valor va a colocar", choices = levels(iris$Species), selected = "setosa"),
  dataTableOutput("tableout")
)


server<-function(input,output){
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    ggplot(filter(dat, ideo5 == input$values) , aes(x=as.factor(pid7) )) + geom_bar()
    
    
  })
  output$tableout <- renderDataTable(iris %>% filter(Species == input$checkbox))
  
}

shinyApp(ui = ui, server = server)