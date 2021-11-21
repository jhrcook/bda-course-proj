# File input and output.

load_trout_data <- function() {
  readRDS(
    here::here("data", "mike-trout-batting-data.rds")
  )
}
