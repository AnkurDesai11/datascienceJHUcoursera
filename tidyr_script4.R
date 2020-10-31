# We want the values in the class columns to be
# 1, 2, ..., 5 and not class1, class2, ..., class5.
#
# Use the mutate() function from dplyr along with
# parse_number(). Hint: You can "overwrite" a column
# with mutate() by assigning a new value to the existing
# column instead of creating a new column.
#
# Check out ?mutate and/or ?parse_number if you need
# a refresher.
#

#name  class final midterm
#1  Brian class1     B       B
#2  Brian class5     C       A
#3   Jeff class2     E       D
#4   Jeff class4     C       A
#5  Karen class3     C       C
#6  Karen class4     A       A
#7  Roger class2     A       C
#8  Roger class5     A       B
#9  Sally class1     C       A
#10 Sally class3     C       B
#

students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  ### Call to mutate() goes here %>%
  mutate(class = parse_number(class)) %>%
  print

#    name class final midterm
#1  Brian     1     B       B
#2  Brian     5     C       A
#3   Jeff     2     E       D
#4   Jeff     4     C       A
#5  Karen     3     C       C
#6  Karen     4     A       A
#7  Roger     2     A       C
#8  Roger     5     A       B
#9  Sally     1     C       A
#10 Sally     3     C       B