@months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
@students = []
@cohorts = []
@name = ""
@cohort = ""

# method to get students from user
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit # quit the program
  end
end

def start_input
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def get_cohort
  loop do
    @cohort = STDIN.gets.chomp
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
  @name = STDIN.gets.chomp
  while !@name.empty? do
    print "What cohort is #{@name} in? "
    get_cohort
    update_list
    @name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of the Villains Academy".center(50) if @students.count > 0
  puts "-------------".center(50) if @students.count > 0
end

def update_cohorts
  @months.each { |month| @cohorts << month if !@cohorts.include?(month) && @students.any? { |student| student[:cohort] == month } }
end

def save_students
  # open/create file - if creating then set permissions to write "w"
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
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
  puts "Overall, we have #{@students.count} great students".center(50) if @students.count > 0
end

def show_students
  print_header
  print_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't understand, please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
