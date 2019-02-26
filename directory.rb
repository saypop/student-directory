# array with all students
students = [
  "Dr. Hannibal Lecter",
  "Darth sVader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# print list of students
puts "The students of the Villains Academy"
puts "-------------"
students.each { |student| puts student  }
# print the total number of students
puts "Overall, we have #{students.count} great students"
