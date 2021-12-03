# EXERCISES TO COMPLETE:
# fin 1. Extract the addition of students to @students[] within load_students() and input_students() into new method.
# fin 2. Make program load students.csv as default if no file given on startup. Change necessary methods.
    # remove exit if file deosn't exist as still option to input students or choose to exit
    # at this step makes sense to remove all traces of menu option 4
    # but will shortly refactor this to remove student.csv hardcoding instead
# fin 3. Refactor. Consider: method too long, name not clear enough, elegance.
# fin 4. Add feedback messages for if menu selection completed successfully.
# fin 5. Menu options 3 and 4, remove hardcoding of filename, ask for input.
# fin 6. Use code block to access file, not having to close it explicitly.
# 7. Refactor code using csv library.
# 8. Write a short program that reads its own source code and prints it on the screen - see: self_source_print.rb
require "csv"

@students = []

# load students from command line argument file - load from student.csv if no file given
def pre_load_students
    filename = ARGV.first.nil? ? "students.csv" : ARGV.first
    if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exist, 0 loaded"
    end
end

# get input of desired action from user
def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

# methods within interactive_menu
def print_menu
    puts "1. Input students"
    puts "2. Show students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def process(selection)
    case selection
    when "1" then @students = input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit # terminate program
    else puts "Please choose a number: 1 - 4 or 9"
    end
end

# methods within process
def input_students
    puts "Enter a students name, then press enter"
    puts "To finish, hit return twice"

    get_students

    @students
end

def get_students
    name = STDIN.gets.chomp
    cohort = "november"

    while !name.empty? do
        add_student(name, cohort)
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def show_students
    print_header
    print_students_list
    print_footer
end

def save_students
    filename = filename_input
    CSV.open(filename, "w") do |file|
        @students.each do |student|
            file << [student[:name], student[:cohort]]
        end
    end
    puts "Students saved to #{filename}"
end

def load_students(filename = nil)
    filename ? filename : (filename = filename_input)
    CSV.foreach(filename) do |student_info|
        name, cohort = student_info
        add_student(name, cohort)
    end
    puts "Students loaded from #{filename}"
end

def filename_input
    puts "Please enter the name of the file:"
    filename = STDIN.gets.chomp
    if filename[-4..-1] == ".csv"  
        filename 
    else
        puts "Not a valid .csv file" 
        filename_input
    end
end

# methods within show_students
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student| 
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall we have #{@students.count} great students"
end

pre_load_students
interactive_menu