library(tidyverse)

data <- 'assignment2_data_raw.csv' |>
  read_csv() |>
  select(ResponseId, Gender, Nationality, Semester, Safety_C, Protests_C, Protests_EX, Safety_EX) |>
  slice_tail(n=142) |>
  mutate(group = case_when(!is.na(Protests_C) ~ 'Control',
                            is.na(Protests_C) ~ 'Experimental')) |>
  unite(col='Safety', Safety_EX, Safety_C, sep='', na.rm = TRUE) |>
  unite(col='Protest', Protests_C, Protests_EX, sep='', na.rm = TRUE)

write_csv(data, 'assignment2_data_processed.csv')         