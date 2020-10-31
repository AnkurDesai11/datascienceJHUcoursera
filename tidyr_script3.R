# This script builds on the previous one by appending
# a call to spread(), which will allow us to turn the
# values of the test column, midterm and final, into
# column headers (i.e. variables).
#
# You only need to specify two arguments to spread().
# Can you figure out what they are? (Hint: You don't
# have to specify the data argument since we're using
# the %>% operator.
#
#    name    test  class grade
#1  Sally midterm class1     A
#2  Sally   final class1     C
#9  Brian midterm class1     B
#10 Brian   final class1     B
#13  Jeff midterm class2     D
#14  Jeff   final class2     E
#15 Roger midterm class2     C
#16 Roger   final class2     A
#21 Sally midterm class3     B
#22 Sally   final class3     C
#27 Karen midterm class3     C
#28 Karen   final class3     C
#33  Jeff midterm class4     A
#34  Jeff   final class4     C
#37 Karen midterm class4     A
#38 Karen   final class4     A
#45 Roger midterm class5     B
#46 Roger   final class5     A
#49 Brian midterm class5     A
#50 Brian   final class5     C


students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, -name) %>%
  print


#     name  class final midterm
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