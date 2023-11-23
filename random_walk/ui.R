library(shiny)
library(ggplot2)

# Define the UI
ui <- fluidPage(
    titlePanel("Random Walk Approximation of Bounded Diffusion Process"),
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
)