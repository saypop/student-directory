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
    # get hobby
    # print "Enter hobby for #{name}: "
    # hobby = gets.chomp
    # get cob
    # print "Enter country of birth for #{name}: "
    # cob = gets.chomp
    # get dob
    # print "Enter date of birth for #{name}: "
    # dob = gets.chomp
    # get height
    # print "Enter height for #{name}: "
    # height = gets.chomp
    # add the student hash to the array
    print "What cohort is #{name} in? "
    while true
      cohort = gets.chomp
      cohort = "november" if cohort.empty?
      if ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"].include? cohort.downcase
        break
      else
        print "Looks like you made a spelling mistake, please enter that month again or leave blank to use default: "
      end
    end
    students << {name: name, cohort: cohort.downcase.to_sym } # , hobby: hobby, cob: cob, dob: dob, height: height }
    puts "Now we have #{students.count} student#{"s" if students.count > 1}"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
# methods to print header, list, and footer
def print_header
  puts "The students of the Villains Academy".center(50)
  puts "-------------".center(50)
end
def print_list(students) #, letter)
  cohorts(students).each do |cohort|
    i = 0
    puts "#{cohort.upcase} COHORT".center(50)
    while i < students.count
      puts "#{i + 1}. #{students[i][:name]}".center(50) if students[i][:cohort] == cohort # students[i][:name][0] == letter && students[i][:name].length < 12
      i += 1
    end
  end
  # students.each.with_index(1) { |student, index| puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter && student[:name].length < 12 }
end
def cohorts(students)
  cohorts = []
  students.each { |student| cohorts << student[:cohort] unless cohorts.include? student[:cohort] }
  cohorts.sort!
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end
def get_letter
  print "Select a letter: "
  return gets.chomp
end
# call methods
students = input_students
# letter = get_letter
if students.count > 0
  print_header
  print_list(students) #, letter)
  print_footer(students)
end
