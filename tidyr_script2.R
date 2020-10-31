# Call gather() to gather the columns class1
# through class5 into a new variable called class.
# The 'key' should be class, and the 'value'
# should be grade.
#
# tidyr makes it easy to reference multiple adjacent
# columns with class1:class5, just like with sequences
# of numbers.
#
# Since each student is only enrolled in two of
# the five possible classes, there are lots of missing
# values (i.e. NAs). Use the argument na.rm = TRUE
# to omit these values from the final result.
#
# Remember that when you're using the %>% operator,
# the value to the left of it gets inserted as the
# first argument to the function on the right.
#
# Consult ?gather and/or ?chain if you get stuck.
#

students3
name    test class1 class2 class3 class4 class5
1  Sally midterm      A   <NA>      B   <NA>   <NA>
2  Sally   final      C   <NA>      C   <NA>   <NA>
3   Jeff midterm   <NA>      D   <NA>      A   <NA>
4   Jeff   final   <NA>      E   <NA>      C   <NA>
5  Roger midterm   <NA>      C   <NA>   <NA>      B
6  Roger   final   <NA>      A   <NA>   <NA>      A
7  Karen midterm   <NA>   <NA>      C      A   <NA>
8  Karen   final   <NA>   <NA>      C      A   <NA>
9  Brian midterm      B   <NA>   <NA>   <NA>      A
10 Brian   final      B   <NA>   <NA>   <NA>      C


students3 %>%
  gather(class ,grade ,-name,-test, na.rm = TRUE) %>%
  print





name    test  class grade
1  Sally midterm class1     A
2  Sally   final class1     C
9  Brian midterm class1     B
10 Brian   final class1     B
13  Jeff midterm class2     D
14  Jeff   final class2     E
15 Roger midterm class2     C
16 Roger   final class2     A
21 Sally midterm class3     B
22 Sally   final class3     C
27 Karen midterm class3     C
28 Karen   final class3     C
33  Jeff midterm class4     A
34  Jeff   final class4     C
37 Karen midterm class4     A
38 Karen   final class4     A
45 Roger midterm class5     B
46 Roger   final class5     A
49 Brian midterm class5     A
50 Brian   final class5     C
