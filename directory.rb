# create an interactive menu
def interactive_menu
    students = []
    loop do
        # 1. print menu options
        puts "1. Input students"
        puts "2. Show students"
        puts "9. Exit"
        # 2. get selection from user
        selection = gets.chomp
        # 3. do what the user has asked
        case selection
        when "1"
            students = input_students
        when "2"
            print_header
            print(students)
            print_footer(students)
        when "9"
            exit # terminate program
        else
            puts "Please choose a number 1 - 9"
      end
    end
end

# create method to get input of names
def input_students
    puts "Enter a students name, then press enter"
    puts "To finish, hit return twice"

    students = []
    name = gets.chomp

    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end

    students
end

# create methods to print each section
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each do |student| 
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(students)
    puts "Overall we have #{students.count} great students"
end

interactive_menu