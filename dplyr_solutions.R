
library(nycflights13)
library(tidyverse)

nycflights13::flights

View(flights)


filter(flights, month == 1, day == 1)

(dec25 <- filter(flights, month == 12, day == 25))


# EX1 Find all flights that

# 1. Had an arrival dely of two or more hours
filter(flights, arr_delay > 120)

# 2. Flew to Houston (IAH or HOU)
filter(flights, dest=="IAH" | dest=="HOU")

# 3. Were operated by United, American, or Delta
table(flights$carrier)
filter(flights, carrier %in% c("UA", "AA", "DL"))

# 4. Departed in summer(July, August, and September)
filter(flights, month >= 6, month <= 8)

# 5. Arrived more than two hours late, but didn't leave late
filter(flights, arr_delay > 120 & dep_delay > 0)

# 6. Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, dep_delay > 60 & arr_delay < dep_delay - 30)

# 7. Departed between midnight and 6am
filter(flights, dep_time < 6)



# EX 2
filter(flights, between(month, 6, 8))

# EX 3
filter(flights, is.na(dep_time))

## arrange()

# EX 1
arrange(flights, !is.na(dep_time))

# EX 2
arrange(flights, desc(arr_delay))
arrange(flights, dep_delay)

# EX 3
arrange(flights, air_time/distance)

# EX 4
arrange(flights, desc(air_time))
arrange(flights, air_time)


## select()

# EX 1
flights[,c(4,6,7,9)]
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, starts_with("dep"), starts_with("arr"))

# EX 2
select(flights, dep_time, dep_time)

# EX 3
vars <- c("year", "month", "day", "dep_delay", "arr_delay") 
select(flights, one_of(vars))

# EX 4
select(flights, contains("TIME"))
select(flights, contains("TIME", ignore.case=FALSE))


## mutate()

# EX 1
flights_ext <- mutate(flights, dep_time_min = floor(dep_time / 100)*60 + dep_time %% 100)

# EX 2
select(flights, air_time, arr_time, dep_time)

flights_ext <- mutate(flights, arr_time_min = floor(arr_time / 100)*60 + arr_time %% 100,
                               dep_time_min = floor(dep_time / 100)*60 + dep_time %% 100,
                               air_time_min = arr_time_min - dep_time_min)

select(flights_ext, air_time, arr_time_min, dep_time_min, air_time_min)

# EX 3
select(flights, dep_time, sched_dep_time, dep_delay)

flights$sched_dep_time + flights$dep_delay == flights$dep_time

flights_ext <- mutate(flights_ext, sched_dep_time_min = floor(sched_dep_time / 100)*60 + sched_dep_time)

select(flights_ext, sched_dep_time_min, dep_delay, dep_time_min)

flights_ext$sched_dep_time_min + flights_ext$dep_delay == flights_ext$dep_time_min


mutate(flights_ext, dep_time_min)


# summarise()



# EX 2

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% count(dest)

flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay)) %>%
  group_by(dest) %>%
  summarise(count = n())

not_cancelled %>% count(tailnum, wt = distance)

flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay)) %>%
  group_by(tailnum) %>%
  summarise(tot = sum(distance))


# EX 4

flights %>%
  filter(is.na(dep_time)) %>%
  group_by(year, month, day) %>%
  summarise(count = n()) %>%
  ggplot(aes(y=count, x=month*30 + day)) +
  geom_line()

flights %>%
  filter(!is.na(dep_time)) %>%
  group_by(year, month, day) %>%
  summarise(count = n(), avg_delay = mean(arr_delay, na.rm=TRUE)) %>%
  ggplot(aes(y=avg_delay, x=count)) +
  geom_point()




# EX

flights %>%
  group_by(tailnum) %>%
  summarise(num_flght = n(), num_del = sum(is.na(arr_delay)), num_del / num_flght) %>%
  ggplot(aes(x=num_flght, y=num_del)) + geom_point()

flights %>%
  group_by(tailnum) %>%
  summarise(num_flght = n(), num_del = sum(is.na(arr_delay)), num_del / num_flght) %>%
  filter(num_flght < 1000) %>%
  ggplot(aes(x=num_flght, y=num_del)) + geom_point()

