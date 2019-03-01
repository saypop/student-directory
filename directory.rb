@months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
@students = []
@cohorts = []
@name = ""
@cohort = ""
@filename = "students.csv"
require 'csv'

def try_load_students
  @filename = ARGV.first if !ARGV.first.nil? # use the argument if no argument is supplied
  if File.exists?(@filename) # if it exists
    load_students # load the file
    puts "Loaded #{@students.count} from #{@filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students
  CSV.foreach(@filename) do |row|
    @name, @cohort = row[0], row[1]
    update_list
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
    input_students
    puts "#{@students.count} students are currently loaded."
  when "2"
    show_students
  when "3"
    print "What would you like to name the file? "
    @filename = STDIN.gets.chomp
    save_students
    puts "#{@students.count} students have been saved to #{@filename}."
  when "4"
    print "Which file would you like to load? "
    @filename = STDIN.gets.chomp
    load_students
    puts "#{@students.count} students have been loaded from #{@filename}."
  when "9"
    exit
  else
    puts "I don't understand, please try again."
  end
end

def input_students
  start_input
  while !@name.empty? do # check if the name is not empty
    print "What cohort is #{@name} in? "
    get_cohort
    update_list
    puts "Now we have #{@students.count} student#{"s" if @students.count > 1}"
    @name = STDIN.gets.chomp # reset the name equal to the input
  end
end

def start_input
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @name = STDIN.gets.chomp # set the name equal to the input
end

def get_cohort
  loop do
    @cohort = STDIN.gets.chomp # get the cohort from the user
    @cohort = "november" if @cohort.empty? # use default if it's blank
    if @months.include? @cohort.to_sym.downcase # check spelling
      break
    else
      print "Looks like you made a spelling mistake, please enter that month again or leave blank to use default: "
    end
  end
end

def update_list
  # update the list with the name and cohort
  @students << {name: @name, cohort: @cohort.downcase.to_sym }
end

def update_cohorts
  # for each month add the month to the cohort if it doesn't already exist and there are students in the cohort
  @months.each { |month| @cohorts << month if !@cohorts.include?(month) && @students.any? { |student| student[:cohort] == month } }
end

def save_students
  CSV.open(@filename, "wb") do |csv| # open/create file - if creating then set permissions to write "w"
    @students.each do |student| # for each entry
      csv << [student[:name], student[:cohort]] # create array with data for one line
    end
  end
end

def show_students
  print_header
  print_list
  print_footer
end

def print_header
  puts "The students of the Villains Academy".center(50) if @students.count > 0
  puts "-------------".center(50) if @students.count > 0
end

def print_list
  update_cohorts
  @months.each do |m|
    @month = m
    if @cohorts.include?(@month)
      puts "#{@month.to_s.upcase} COHORT".center(50)
      print_students
    end
  end
end

def print_students
  i = 1 # set index to 1
  @students.each do |student| # for each student
    if student[:cohort] == @month # if the student is in the right cohort
      puts "#{i}. #{student[:name]}".center(50) # print the index and the name of the student
      i += 1 # step up the index
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50) if @students.count > 0
end

try_load_students
interactive_menu
