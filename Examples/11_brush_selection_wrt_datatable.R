## Advanced App - brush

server <- function(input,output, session) {
  
  library(ggplot2) # for the diamonds dataset, and ggplot feature
  library(DT)      # for the dataTableOutput
  library(shiny)   # should always be activated
  
  output$plot <- renderPlot({
    ggplot(diamonds, aes(price, carat)) + geom_point() # scatter plot
  })
  
  diam <- reactive({
    user_brush <- input$user_brush
    selelection <- brushedPoints(diamonds, user_brush)
    return(selelection)
  })
  
  output$table <- DT::renderDataTable(DT::datatable(diam()))
}

ui <- fluidPage(
  h1("Using the brush feature to select specific observations"),
  plotOutput(outputId="plot", brush = "user_brush"),
  dataTableOutput(outputId="table")
)

shinyApp(ui = ui, server = server)