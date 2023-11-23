# Define the server
server <- function(input, output) {
    # Generate the random walk approximation of a bounded diffusion process
    generate_diffusion <- function(n_steps, step_size, boundary) {
        position <- 0
        positions <- numeric(n_steps)
        
        for (i in 1:n_steps) {
            step <- rnorm(1, mean = 0, sd = step_size)
            position <- position + step
            position <- pmax(pmin(position, boundary), -boundary)  # Apply boundary constraints
            positions[i] <- position
        }
        
        positions
    }
    
    # Render the diffusion plot
    output$diffusion_plot <- renderPlot({
        n_steps <- input$n_steps
        step_size <- input$step_size
        boundary <- input$boundary
        
        positions <- generate_diffusion(n_steps, step_size, boundary)
        
        ggplot(data.frame(step = 1:n_steps, position = positions), aes(x = step, y = position)) +
            geom_line() +
            geom_hline(yintercept = -boundary, linetype = "dashed") +
            geom_hline(yintercept = boundary, linetype = "dashed") +
            labs(title = "Random Walk Approximation of Bounded Diffusion Process",
                 x = "Step", y = "Position") +
            theme_minimal()
    })
}
