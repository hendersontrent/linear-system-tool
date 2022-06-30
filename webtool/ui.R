
# Define UI for web application

shinyUI(navbarPage(theme = "corp-styles.css", 
                   title = "Linear system of equations tool",
                   position = c("static-top"), windowTitle = "Linear system of equations tool",
                   id = "page_tab",
                   
                   #------------------ Home page -----------------
                   
                   tabPanel("HOME",
                            tags$head(
                              tags$link(rel = "stylesheet", type = "text/css", href = "corp-styles.css")
                            ),
                            
                   #------------------ Mathematics ---------------
                            
                            fluidRow(h1("Linear system of equation tool")),
                                     sidebarLayout(
                                       sidebarPanel(
                                         h2("Tool information"),
                                         br(),
                                         radioButtons("varSelect", "How many variables do you wish to solve for?", 
                                                      choices = c(2, 3), selected = 2, inline = TRUE),
                                         br(),
                                         p("After making selections above, click the button below to generate the linear system to solve."),
                                         actionButton("generateSystem", "Generate Equations"),
                                         
                                       ),
                                       mainPanel(fluidRow(
                                         column(11,
                                                h3("System of equations"),
                                                h4("Equation form"),
                                                br(),
                                                h4("Matrix form"),
                                                hr()
                                         ),
                                         column(2),
                                         column(8,
                                                fluidRow(
                                                  actionButton("showAnswers", "Show Answers"),
                                                )
                                               ),
                                         column(2)
                                        ),
                                        fluidRow(
                                          column(11,
                                                 h4("Answers"),
                                                 shinycssloaders::withSpinner()
                                         )
                                        )
                                       )
                                      )
                                     )
  )
)