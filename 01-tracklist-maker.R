# --- TRACKLIST MAKER ---
# This script takes a tracklist with track titles and runtimes
#    in the Wikipedia format, and converts it to a format readable
#    by the ffmpeg split_audio.sh script
rm(list = ls())
library(readr)
library(glue)
library(dplyr)
library(lubridate)

file <- "tracklist.txt"
path <- "~/Music/split/"

# Read in tracklist -------------------------------------------------------
tracklist <- read_delim(
  file = glue("{path}{file}"),
  delim = " – ",
  col_names = c("trackname", "runtime"),
  col_types = "cc"
  ) %>% 


# Tidy Data ---------------------------------------------------------------

  mutate(
    # Parse the raw time into duration
    runtime = as.duration(ms(runtime)),
    # Calculate cumulative time from track runtimes and convert to HMS
    ctime = runtime %>% 
      cumsum() %>% 
      hms::as_hms()
      # hms::as_hms(cumsum(runtime))
  ) %>% 
  select(
    ctime,
    trackname
  )

View(tracklist)
