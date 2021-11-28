@students = []

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def print_menu
    puts "1. Input students"
    puts "2. Show students"
    puts "3. Save the list to students.csv"
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
    when "9"
        exit # terminate program 
    else
        puts "Please choose a number 1 - 9" 
  end
end

def input_students
    puts "Enter a students name, then press enter"
    puts "To finish, hit return twice"

    name = gets.chomp

    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        name = gets.chomp
    end

    @students
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

# methods to print 
def show_students
    print_header
    print_students_list
    print_footer
end

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

interactive_menu