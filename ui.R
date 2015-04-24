shinyUI(
  pageWithSidebar(
    #Application title
    headerPanel("Next Word Prediction!!!"),
    
    
    sidebarPanel(
      
      textInput("phrase","Please enter the phrase for which the next word is to be predicted:"),
      
      radioButtons("input_type", "Please select the Data Type:",
                         c("Continuous" = "cont",
                           "Discrete" = "disc"),inline=TRUE),
      submitButton('Predict Next Word')
      ),
    
    # Show a tabset that includes a plot, summary, and
    # table view of the generated distribution
    mainPanel(
      h4("Summary Statistics:"),
      p("In this section Basic Statistics for the given data are calculated."),
      verbatimTextOutput("Summary"),
      br(),
      
      h4("Data Visualization:"),
      p("In this section given data is visualized using common statistical plots."),
      tabsetPanel(
        tabPanel("Stem and Leaf Plot", verbatimTextOutput("StemPlot")),
        tabPanel("Histogram/Bar Plot", plotOutput("Histogram")),
        tabPanel("Box Plot", plotOutput("BoxPlot"))
      ),
      br(),
      
      h4("Tests for Normality (if Data Type is continuous):"),
      p("In this section given data (if it is continuous) is tested for normality using common statistical procedures."),
      tabsetPanel(
        tabPanel("Q-Q Plot", plotOutput("QQPlot")),
        tabPanel("Shapiro-Wilk Test for Normality", verbatimTextOutput("ShapiroTest"))
      )
    )      
)
)