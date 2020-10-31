# Append two more function calls to accomplish the following:
#
# 1. Use group_by() (from dplyr) to group the data by part and
# sex, in that order.
#
# 2. Use mutate to add two new columns, whose values will be
# automatically computed group-by-group:
#
#   * total = sum(count)
#   * prop = count / total
#

#  score_range part  sex    count
#  <chr>       <chr> <chr>  <int>
#1 700-800     read  male   40151
#2 600-690     read  male  121950
#3 500-590     read  male  227141
#4 400-490     read  male  242554
#5 300-390     read  male  113568
#6 200-290     read  male   30728
#7 700-800     read  fem    38898
#8 600-690     read  fem   126084
#9 500-590     read  fem   259553
#10400-490     read  fem   296793
# ... with 26 more rows


sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  ### <Your call to group_by()> %>%
  group_by(part, sex) %>%
  mutate(total = sum(count),
         prop = count / total
  ) %>% print

#  score_range part  sex    count  total   prop
# <chr>       <chr> <chr>  <int>  <int>  <dbl>
#1 700-800     read  male   40151 776092 0.0517
#2 600-690     read  male  121950 776092 0.157 
#3 500-590     read  male  227141 776092 0.293 
#4 400-490     read  male  242554 776092 0.313 
#5 300-390     read  male  113568 776092 0.146 
#6 200-290     read  male   30728 776092 0.0396
#7 700-800     read  fem    38898 883955 0.0440
#8 600-690     read  fem   126084 883955 0.143 
#9 500-590     read  fem   259553 883955 0.294 
#10400-490     read  fem   296793 883955 0.336 
# ... with 26 more rows