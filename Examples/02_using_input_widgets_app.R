## Using Input Widgets

library(shiny)

server <- function(input, output, session) {}

ui <- basicPage(
  h1("Using textInput and checkboxInput"),
  textInput(inputId="mystring", label="Write here", value = ""),
  checkboxInput(inputId="mycheckbox", label="Factor Y", value = TRUE)
)

shinyApp(ui = ui, server = server)
