## Making the app reactive

library(shiny)

server <- function(input, output, session) {
  observe({
    addtext <- paste("your initial input:", input$mystring)
    updateTextInput(session=session, inputId="mystring2", value=addtext)
  })
}

ui <- basicPage(
  h1("Using Observe"),
  textInput(inputId="mystring", label="Write here", value=""),
  textInput(inputId="mystring2", label="Full App Output", value="")
)

shinyApp(ui = ui, server = server)
