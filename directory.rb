@months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
@students = []
@cohorts = []
@name = ""
@cohort = ""

# method to get students from user
def start_input
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def get_cohort
  loop do
    @cohort = gets.chomp
    @cohort = "november" if @cohort.empty?
    if @months.include? @cohort.to_sym.downcase
      break
    else
      print "Looks like you made a spelling mistake, please enter that month again or leave blank to use default: "
    end
  end
end

def update_list
  @students << {name: @name, cohort: @cohort.downcase.to_sym }
  puts "Now we have #{@students.count} student#{"s" if @students.count > 1}"
end

def input_students
  start_input
  @name = gets.chomp
  while !@name.empty? do
    print "What cohort is #{@name} in? "
    get_cohort
    update_list
    @name = gets.chomp
  end
end

def print_header
  puts "The students of the Villains Academy".center(50)
  puts "-------------".center(50)
end

def update_cohorts
  @months.each { |month| @cohorts << month if !@cohorts.include?(month) && @students.any? { |student| student[:cohort] == month } }
end

def print_list
  update_cohorts
  @cohorts.each do |c|
    puts "#{c.to_s.upcase} COHORT".center(50)
    i = 1
    @students.each do |student|
      if student[:cohort] == c
        puts "#{i}. #{student[:name]}".center(50)
        i += 1
      end
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def show_students
  print_header
  print_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't understand, please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
