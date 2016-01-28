## Shiny ui.R
library(shiny)
shinyUI(pageWithSidebar(
    headerPanel('The Effect of Tobacco, Alcohol, and Age on Esophageal Cancer Rates'),
    sidebarPanel(
        h3('Indicators'),
        selectInput("age", "Age:", choices = c('25-34'='25-34','35-44'='35-44', '45-54'='45-54', '55-64'='55-64', '65-74'='65-74', '75+'='75+')),
        selectInput("alcohol", "Alcohol Intake (Drinks per Day):", choices = c('0-3'='0-3','4-6'='4-6', '7-8'='7-8', '9+'='9+')),
        selectInput("tobacco", "Tobacco Intake (Cigarettes per Day):", choices = c('0-9 (0-4 Pipe Bowls)'='0-9 (0-4 Pipe Bowls)','10-19 (1 Cigar/5-8 Pipe Bowls)'='10-19 (1 Cigar/5-8 Pipe Bowls)', '20-29 (2 Cigars/9-12 Pipe Bowls)'='20-29 (2 Cigars/9-12 Pipe Bowls)', '30+ (3+ Cigars/13+ Pipe Bowls)'='30+ (3+ Cigars/13+ Pipe Bowls)')),
        actionButton('goButton', "Assess")
    ),
    mainPanel(
        h3("Esophageal Cancer Risk"),
        h4('You are:'),
        verbatimTextOutput("age"),
        h4('years old.'),
        h1(' '),
        h4('You drink:'),
        verbatimTextOutput("alcohol"),
        h4('alcoholic drinks per day.'),
        h1(' '),
        h4('You smoke:'),
        verbatimTextOutput("tobacco"),
        h4('Cigarettes per day.'),
        h1(' '),
        h4('You have a:'),
        verbatimTextOutput('risk'),
        h4('Probability of esophageal cancer in your age group.')
    )
))