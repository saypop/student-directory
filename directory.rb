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
# methods to print header, list, and footer
def print_header
  puts "The students of the Villains Academy"
  puts "-------------"
end
def print_list(names)
  names.each { |name| puts name  }
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# call methods
print_header
print_list(students)
print_footer(students)
