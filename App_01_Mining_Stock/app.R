library(shiny)
library(DT)
library(ggplot2)
library(shinythemes)

# Part 1: Data
mydata = read.csv("data.csv", header = T, sep = ";")
attach(mydata) # to access columns without mydata$ prefix

# Part 2: Server
server = function(input, output, session){
  
  # table for the "Raw Data" tab. tableDT is outputId at UI
  output$tableDT <- DT::renderDataTable(
    DT::datatable(mydata) %>%  # Use %>% for styling layer by layer
    formatCurrency("MarketCap.in.M", "$", digits = 0) %>%
    formatStyle("Symbol", color = "grey") %>%
    formatStyle(c("G3", "G2", "G1"), backgroundColor = "lightblue"))
  
  # Calculate a new column "points" based on G1, G2, G3 columns and 
  # input slider ID: w1, w2, w3. 
  # weighted.mydata is the updated data from reactive() function so
  # later when using it we need to access as: weighted.mydata()
  weighted.mydata = reactive(
    cbind(mydata,
          points = input$w1 * `G1` + input$w2 * `G2` + input$w3 * `G3`)
  )
  
  # Scatter plot for weighted.mydata
  output$scat = renderPlot({
    ggplot(weighted.mydata(), aes(points, MarketCap.in.M)) +
      geom_point() + geom_smooth(method = "lm") +
      xlab("Calculated Score") + ylab("Market Capitalization in Million USD")
  })
  
  # Data table corresponding to the brush selection at scatter plot
  mydata.new = reactive({
    user_brush <- input$user_brush
    selection <- brushedPoints(weighted.mydata(), user_brush)
    return(selection)
  })
  output$table = DT::renderDataTable(DT::datatable(mydata.new()))
  
  # Download the above data table (mydata.new())
  output$mydownload = downloadHandler(
    filename = "selected_miners.csv",
    content = function(file) {
      write.csv(mydata.new(), file)}
  )
}

# Part 3: UI
ui = navbarPage(
  theme = shinytheme("sandstone"), 
  title = h3("The Mining Stock"),  # firs page title
  
  # First tab: use wellPanel to add several things in one panel
  tabPanel(
    ("Adjust Weights on Mining Stocks"),
    wellPanel( # with 3 sliders
      sliderInput(inputId = "w1",
                  label = "Weight on Grade 1",
                  value = 7, min = 0, max = 20),
      sliderInput(inputId = "w2",
                  label = "Weight on Grade 2",
                  value = 2, min = 0, max = 20),
      sliderInput(inputId = "w3",
                  label = "Weight on Grade 3",
                  value = 0.6, min = 0, max = 6, step = 0.2)
    ),
    
    # Scatter plot
    plotOutput(outputId = "scat", brush = "user_brush"),
    
    # Data table corresponding to the brush selection at scatter plot
    DT::dataTableOutput(outputId = "table"),
    
    # Download the above data table
    downloadButton(outputId = "mydownload", label = "Download Table")
  ),
  
  # Second tab
  # Access to youtube: https://www.youtube.com/watch?v=vySGuusQI3Y
  # click Share -> choose Embed -> Copy <iframe width=....></iframe>
  tabPanel(title = "Documentation",
           h4("Video embedded from Youtube"),
           tags$iframe(style="height:700px; width:100%",
                       src="https://www.youtube.com/embed/vySGuusQI3Y")
  ),
  
  # Third tab
  tabPanel(title = "Raw Data",
           DT::dataTableOutput(outputId = "tableDT")) # be rendered at server
  
)

shinyApp(ui = ui, server = server)