# Accomplish the following three goals:
#
# 1. select() all columns that do NOT contain the word "total",
# since if we have the male and female data, we can always
# recreate the total count in a separate column, if we want it.
# Hint: Use the contains() function, which you'll
# find detailed in 'Special functions' section of ?select.
#
# 2. gather() all columns EXCEPT score_range, using
# key = part_sex and value = count.
#
# 3. separate() part_sex into two separate variables (columns),
# called "part" and "sex", respectively. You may need to check
# the 'Examples' section of ?separate to remember how the 'into'
# argument should be phrased.
#

sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  ### <Your call to separate()> %>%
  separate(part_sex, c("part","sex")) %>%
  print


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