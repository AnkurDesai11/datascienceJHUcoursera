# Add a call to unique() below, which will remove
# duplicate rows from student_info.
#
# Like with the call to the print() function below,
# you can omit the parentheses after the function name.
# This is a nice feature of %>% that applies when
# there are no additional arguments to specify.
#

#    id  name sex
#1  168 Brian   F
#2  168 Brian   F
#3  588 Sally   M
#4  588 Sally   M
#5  710  Jeff   M
#6  710  Jeff   M
#7  731 Roger   F
#8  731 Roger   F
#9  908 Karen   M
#10 908 Karen   M


student_info <- students4 %>%
  select(id, name, sex) %>%
  ### Your code here %>%
  unique() %>%
  print


#   id  name sex
#1 168 Brian   F
#3 588 Sally   M
#5 710  Jeff   M
#7 731 Roger   F
#9 908 Karen   M