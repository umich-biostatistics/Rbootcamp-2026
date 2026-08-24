library(tidyverse)
library(nycflights13)

# 1. What destination received most flights in June?
flights %>%
  left_join(airports, by = c('dest' = 'faa')) %>%
  filter(month == 6) %>%
  group_by(name) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
# Chicago Ohare Intl

# 2. Which carrier had the greatest average distance per flight?
flights %>%
  left_join(airlines, by = c('carrier')) %>%
  group_by(name) %>%
  summarize(ave_dist = mean(distance)) %>%
  arrange(desc(ave_dist))
# Hawaiian Airlines Inc.

# 3. Which flight traveled the fastest (overall miles per hour)?
flights %>%
  mutate(mph = distance / (air_time / 60)) %>%
  slice_max(order_by = mph, n = 1)
# flight 1499

# 4. What day of the year had the largest average arrival delay for all flights?
# What day of the week had the largest average arrival delay for all flights? (only count positive values)
flights %>%
  filter(!is.na(arr_delay)) %>%
  mutate(arr_delay = case_when(arr_delay < 0 ~ 0,
                               .default = arr_delay)) %>%
  filter(arr_delay > 0) %>% 
  group_by(year, month, day) %>%
  summarise(ave_arr_delay = mean(arr_delay)) %>%
  arrange(desc(ave_arr_delay))

library(lubridate)
flights =
  flights %>%
  filter(!is.na(arr_delay)) %>%
  mutate(arr_delay = case_when(arr_delay < 0 ~ 0,
                               .default = arr_delay),
         date = as.Date(paste(year, day, month, sep = '-'),
                        format = '%Y-%d-%m')) %>% 
    filter(arr_delay > 0) 

flights %>%
  mutate(week_day = weekdays(date)) %>%
  group_by(week_day) %>%
  summarise(ave_arr_delay = mean(arr_delay)) %>%
  arrange(desc(ave_arr_delay))

rm(flights)
# 5. What was the total distance for all flights in January? What was the average distance per flight?
flights %>%
  filter(month == 1) %>%
  summarise(total_dist = sum(distance))
# 27188805

flights %>%
  filter(month == 1) %>%
  summarise(ave_dist = mean(distance))
# 1007.

# 6. What day of the week saw the most flights?
flights %>%
  mutate(date = as.Date(paste(year, day, month, sep = '-'),
                        format = '%Y-%d-%m'),
         week_day = weekdays(date)) %>%
  group_by(week_day) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
# Monday    50690

# 7. What was the average number of seats and engines on the plains that left from
# NYC on July 4? (The "seats" and "engines" data comes from the the planes table;
# Warning: Be careful with your joins!)
flights %>%
  filter(month == 7, day == 4) %>%
  left_join(planes, by = 'tailnum') %>%
  select(tailnum, seats, engines) %>%
  # filter(!is.na(seats)) %>%
  summarise(ave_seats = mean(seats, na.rm = T),
            ave_engines = mean(engines, na.rm = T))
# 141.        1.99

# 8. How many airlines do not have the word "air" somewhere in their name? (Hint,
# try googling for a function that can do string matching in R)
airlines %>%
  select(name) %>%
  distinct() %>%
  filter(!stringr::str_detect(airlines$name, 'Air|air'))
# Virgin America

# 9. What was the most common plane model to fly out of NYC in October
# (there is a "model" column in the planes table)?
flights %>%
  filter(month == 10) %>%
  left_join(planes, by = 'tailnum') %>%
  group_by(model) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
# A320-232         3717

# 10. How many planes (tailnum) only flew one route (flight) but flew that route more than 10 times?

flights %>%
  left_join(planes, by = 'tailnum') %>%
  select(tailnum, flight) %>%
  group_by(tailnum) %>%
  mutate(ndflight = n_distinct(flight)) %>%
  filter(ndflight == 1) %>%
  group_by(tailnum) %>%
  summarise(n = n()) %>%
  filter(n > 10)

flights %>%
  select(tailnum, flight) %>%
  group_by(tailnum) %>%
  mutate(ndflight = n_distinct(flight)) %>%
  filter(ndflight == 1) %>%
  group_by(tailnum) %>%
  summarise(n = n()) %>%
  filter(n > 10)

# 12

# 11. Which scheduled departure hour (use the "hour" column) had the largest
# proportion of flights delayed (dep_delay) longer than 5 min?
flights %>%
  group_by(hour) %>%
  filter(!is.na(dep_delay)) %>% 
  mutate(dep_delay = if_else(dep_delay < 0, 0, dep_delay)) %>% 
  summarise(
            prop_delay = sum(dep_delay > 5) / n()) %>%
  arrange(desc(prop_delay))
#  21      0.463

# 12. Which flight(s) had the greatest scheduled length (time between scheduled
# departure and arrival)? (Warning: Take notice how the values of sched_arr_time
# and sched_dep_time are formatted in the table).
flights %>%
  mutate(length = sched_arr_time - sched_dep_time)

sched_len =
  flights %>%
  mutate(sched_dep_time = as.POSIXct(sprintf("%04.0f", sched_dep_time), format="%H%M"),
         sched_arr_time = as.POSIXct(sprintf("%04.0f", sched_arr_time), format="%H%M"),
         sched_diff = difftime(sched_arr_time, sched_dep_time, units = "secs")) %>%
  select(sched_dep_time,
         sched_arr_time,
         sched_diff,
         origin,
         dest) %>%
  mutate(sched_arr_time_new = case_when(sched_diff < 0 ~ sched_arr_time + 86400,
                                        .default = sched_arr_time),
         sched_diff_new = sched_arr_time_new - sched_dep_time)

sched_len %>%
  arrange(desc(sched_diff_new)) %>%
  head(1) %>%
  View()

# JFK  to  HNL
