#!/usr/bin/env Rscript

library(baseballr)
library(mustashe)
library(glue)
library(tidyverse)

stash("mike_trout_ids", {
  mike_trout_ids <- playerid_lookup("Trout", "Mike")
})

if (nrow(mike_trout_ids) == 0) {
  stop("Could not find IDs for Mike Trout")
} else if (nrow(mike_trout_ids) > 1) {
  stop(glue("Found {nrow(mike_trout_ids)} IDs - expected 1."))
}

trout_mlb_id <- mike_trout_ids$mlbam_id[[1]]

trout_batter_data <- map_dfr(seq(2011, 2021), function(year) {
  scrape_statcast_savant_batter(
    start_date = glue("{year}-01-01"),
    end_date = glue("{year}-12-31"),
    batterid = trout_mlb_id
  )
})


data_fname <- "mike-trout-batting-data"
write_csv(
  trout_batter_data, here::here("data", glue("{data_fname}.csv"))
)
saveRDS(
  trout_batter_data, here::here("data", glue("{data_fname}.rds"))
)
