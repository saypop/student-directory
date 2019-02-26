# method to get students from user
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
# methods to print header, list, and footer
def print_header
  puts "The students of the Villains Academy"
  puts "-------------"
end
def print_list(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# call methods
students = input_students
print_header
print_list(students)
print_footer(students)
