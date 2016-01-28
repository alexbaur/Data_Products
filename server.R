## server.r
library(shiny)
library(datasets)
cancer <- esoph
levels(cancer$alcgp) <- list('0-3'='0-39g/day','4-6'='40-79', '7-8'='80-119', '9+'='120+')
levels(cancer$tobgp) <- list('0-9 (0-4 Pipe Bowls)'='0-9g/day','10-19 (1 Cigar/5-8 Pipe Bowls)'='10-19', '20-29 (2 Cigars/9-12 Pipe Bowls)'='20-29', '30+ (3+ Cigars/13+ Pipe Bowls)'='30+')

shinyServer(
    function(input, output, session){
        output$age <- renderPrint({
            input$goButton
            isolate(paste(unlist(input$age)))
        })
        output$alcohol <- renderPrint({
            input$goButton
            isolate(paste(input$alcohol))
        })
        output$tobacco <- renderPrint({
            input$goButton
            isolate(paste(input$tobacco))
        })
        
        outcome <- reactive({
            x <- subset(cancer, cancer$agegp %in% input$age)
            y <- subset(x, x$alcgp %in% input$alcohol)
            z <- subset(y, y$tobgp %in% input$tobacco)
            zapp <- z$ncases/z$ncontrols
            zapp
        })
        
        output$risk <- renderPrint({
            input$goButton
            isolate(paste(outcome()))
        })
    }
)