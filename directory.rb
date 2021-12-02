@students = []

# load students from command line argument file, if file exists
def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exist"
        exit
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
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def process(selection)
    case selection
    when "1"
        @students = input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        load_students
    when "9"
        exit # terminate program 
    else
        puts "Please choose a number: 1 - 4 or 9" 
  end
end

def input_students
    puts "Enter a students name, then press enter"
    puts "To finish, hit return twice"

    name = STDIN.gets.chomp

    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end

    @students
end

def show_students
    print_header
    print_students_list
    print_footer
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym}
    end
  file.close 
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

try_load_students
interactive_menu
