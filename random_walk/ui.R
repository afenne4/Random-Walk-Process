library(shiny)
library(ggplot2)
library(mathjaxr)
# Define the UI

ui <- fluidPage(
    titlePanel("Random Walk Approximation of Bounded Diffusion Process"),
    tabsetPanel(
        tabPanel("Formulas",
                 h3("Formulas"),
                 withMathJax("$$ p = \\frac{1}{2} \\left(1+\\frac{\\mu\\sqrt{\\tau}}{\\sigma}\\right)$$"),
                 withMathJax("$$ q = \\frac{1}{2} \\left(1-\\frac{\\mu\\sqrt{\\tau}}{\\sigma}\\right)$$"),
                 withMathJax("$$ \\Delta = \\sigma \\sqrt{\\tau}$$")
                 ),
        tabPanel("Random Walk Plot",
                 sidebarLayout(
                     sidebarPanel(
                         sliderInput("n_steps", "Number of Steps", min = 1, max = 100, value = 10),
                         sliderInput("step_size", "Step Size", min = 0.1, max = 1, value = 0.5),
                         sliderInput("boundary", "Boundary", min = 1, max = 10, value = 5)
                     ),
                     mainPanel(
                         plotOutput("diffusion_plot")
                     )
                 )
                 # Content for Tab 2
        )
    )
)

# ui <- fluidPage(
#     titlePanel("Random Walk Approximation of Bounded Diffusion Process"),
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("n_steps", "Number of Steps", min = 1, max = 100, value = 10),
#             sliderInput("step_size", "Step Size", min = 0.1, max = 1, value = 0.5),
#             sliderInput("boundary", "Boundary", min = 1, max = 10, value = 5)
#         ),
#         mainPanel(
#             plotOutput("diffusion_plot")
#         )
#     )
# )