## Simple datatable
library(shiny)
library(ggplot2)  # for diamonds dataset
library(DT)

server <- function(input, output, session) {
  
  output$tableDT <- DT::renderDataTable(
                          diamonds[1:1000,],
                          options = list(paging=F),
                          rownames=F,  # F is False
                          filter = "top")
  
}

ui <- fluidPage(
  DT::dataTableOutput(outputId="tableDT")
)

shinyApp(ui = ui, server = server)