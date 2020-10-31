# select() the id, class, midterm, and final columns
# (in that order) and store the result in gradebook.
#

#   id  name sex
#1 168 Brian   F
#3 588 Sally   M
#5 710  Jeff   M
#7 731 Roger   F
#9 908 Karen   M

gradebook <- students4 %>%
  ### Your code here %>%
  select(id, class, midterm,final) %>%
  print

#    id class midterm final
#1  168     1       B     B
#2  168     5       A     C
#3  588     1       A     C
#4  588     3       B     C
#5  710     2       D     E
#6  710     4       A     C
#7  731     2       C     A
#8  731     5       B     A
#9  908     3       C     C
#10 908     4       A     A
