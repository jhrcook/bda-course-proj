# Plotting

set_project_theme <- function() {
  theme_set(
    theme_classic() +
      theme(
        strip.background = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.major = element_line(),
        plot.title = element_text(hjust = 0.5)
      )
  )
}
