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
                            
                   #------------------ Mathematics --------------
                            
                            fluidRow(h1("Linear system of equation tool")),
                                     sidebarLayout(
                                       sidebarPanel(
                                         h2("Tool information"),
                                         
                                       ),
                                       mainPanel(fluidRow(
                                         column(11,
                                                h3("Low Dimension Plot"),
                                                shinycssloaders::withSpinner(plotlyOutput("low_dim_plot", height = "600px"))
                                        )
                                       )
                                      )
                                     )
    )
  )
)