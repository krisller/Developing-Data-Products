data(mtcars) #Load data set mtcars

carsdata <- mtcars #Set data set to carsdata object

#Change the variables cyl, vs, am, gear and carb to factor
carsdata$cyl <- as.factor(carsdata$cyl)
carsdata$vs <- as.factor(carsdata$vs)
carsdata$am <- as.factor(carsdata$am)
carsdata$gear <- as.factor(carsdata$gear)
carsdata$carb <- as.factor(carsdata$carb)

#Change the levels for better comprehension
levels(carsdata$am) <- c("Auto","Manual")
levels(carsdata$vs) <- c("V","S")

shinyServer(
        function(input, output) {                
        
                formula <- reactive({
                       paste0(input$ddlresponse, " ~ ", input$ddlterms, " - 1") 
                })
                
                output$LM <- renderTable({
                        lm(as.formula(formula()), data = carsdata)
                })
                
                output$boxplotLM <- renderPlot({
                        boxplot(as.formula(formula()), data = carsdata, xlab = input$ddlterms, ylab = input$ddlresponse)                                
                })
                
               output$listDataset <- renderTable(carsdata)
                
        }
)