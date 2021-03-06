library(shiny)
library(data.table)
library(DT)


args <- commandArgs(trailingOnly=T)
port <- as.numeric(args[[1]])


source('Scripts/read_data.R')

#Replace NA seeds with "none"
cbb$SEED <- as.character(cbb$SEED)
cbb[is.na(cbb$SEED), ]$SEED <- "None"

#Replace NA postseason with "none"
cbb[is.na(cbb$POSTSEASON), ]$POSTSEASON <- "None"

ui <- fluidPage(
  titlePanel("2019 NCAA Men's D1 Basketball DataTable"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("CONF",
                       "Conference:",
                       c("All",
                         as.character(unique(cbb$CONF))))
    ),
    column(4,
           selectInput("SEED",
                       "Seed:",
                       c("All",
                         as.character(unique(cbb$SEED))))
           
    ),
    column(4,
           selectInput("POSTSEASON",
                       "Postseason:",
                       c("All",
                         as.character(unique(cbb$POSTSEASON))))
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table"),

)

server <- function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- cbb
    if (input$CONF != "All") {
      data <- data[as.character(data$CONF) == input$CONF,]
    }
    if (input$SEED != "All") {
      data <- data[data$SEED == input$SEED,]
    }
    
    if (input$POSTSEASON != "All") {
      data <- data[as.character(data$POSTSEASON) == input$POSTSEASON,]
    }
    data
  }, extensions="Buttons", options=list(dom="Bfrtip", buttons = c("csv", "excel", "pdf", "print"))))
  
  
}

# Run the application 
#shinyApp(ui = ui, server = server)
shinyApp(ui = ui, server = server, options = list(port=port,
                                                  host="0.0.0.0"))

