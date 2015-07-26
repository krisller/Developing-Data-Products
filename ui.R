library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("MTCARS"),                
        sidebarPanel(
                selectInput('ddlresponse', "Response:", 
                                c("Miles/(US) gallon" = "mpg",
                                  "Displacement" = "disp",
                                  "Gross horsepower" = "hp",
                                  "Rear axle ratio" = "drat",
                                  "Weight (lb/1000)" = "wt",
                                  "1/4 mile time" = "qsec")),
                selectInput("ddlterms", "Term:",
                                   c("Cylinders" = "cyl",
                                     "Transmission" = "am",
                                     "Gears" = "gear",
                                     "Carburetors" = "carb",
                                     "V/S" = "vs"), selected = "am")
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel("Linear Model", tableOutput('LM')), 
                        tabPanel("Box Plot", plotOutput('boxplotLM')),
                        tabPanel("Table", tableOutput('listDataset'))
                )
                
        )
))
