## A basic shiny app

# Load lib
library(shiny)

# the server
server = function(input, output, session) {} 

# the user interface
ui = basicPage("The First basic app")

# perform app launch
shinyApp(ui = ui, server = server) 