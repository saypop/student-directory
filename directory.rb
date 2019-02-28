$months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

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
      if $months.include? cohort.to_sym.downcase
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
    puts "#{cohort.to_s.upcase} COHORT".center(50)
    i = 1
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{i}. #{student[:name]}".center(50)  # students[i][:name][0] == letter && students[i][:name].length < 12
        i += 1
      end
    end
  end
  # students.each.with_index(1) { |student, index| puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter && student[:name].length < 12 }
end
def cohorts(students)
  cohorts = []
  $months.each { |month| cohorts << month if !cohorts.include?(month) && students.any? { |student| student[:cohort] == month } }
  cohorts
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end
def get_letter
  print "Select a letter: "
  return gets.chomp
end
def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_list(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't understand, please try again."
    end
    # 4. repeat from step 1
  end
end
# call methods
# students = input_students
# letter = get_letter
# if students.count > 0
#   print_header
#   print_list(students) #, letter)
#   print_footer(students)
# end
interactive_menu
