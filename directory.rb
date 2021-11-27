# EXERCISES TO COMPLETE:
# fin 1 Print 1. 2. 3. etc in front of students names using each_with_index()
# fin 2 Modify to print only students starting with a specific letter
        # have asked user if they would like to filter and for letter
# fin 3 Modify your program to print student only if name length < 12
# fin 4 Rewrite each() using while or until loops
# 5 Add more information, hobbies, country of birth, height etc
# fin 6 Research the method center() of String class. Use to make output aligned
# fin 7 Ask for input for name and cohort in input_students method. Consider:
        # for empty values – add default
	    # convert string to symbol
	    # what if user makes a typo
# 8 Change the way users are displayed – grouped by cohorts 
# 9 Change to print “...we have 1 student” not students when only one student
# 10 Find a method to replace chomp(), it will require passing arguments
# 11 Typo finding exercise – see branch exercise_11
# 12 Only print the list if there is at least one student
# ----------

# create method to get input of names
def input_students
    puts "When prompted please enter student's information and press enter"
    puts "Please be aware entries with names over 11 characters will not be shown"

    students = []
    cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", ""]
    name = ""
    cohort_str = "month"
    height = ""
    add_more = "yes"

    while add_more == "yes"
        while name.empty? do
            puts "Enter student's name:"
            name = gets.chomp
        end
        until cohorts.include?(cohort_str)
            puts "Enter student's cohort:"
            cohort_str = gets.chomp
            cohort = (cohort_str == "" ? "no assigned cohort" : cohort_str.to_sym)
        end
        until height =~ /[0-9]/
            puts "Enter student's height in cm:"
            height = gets.chomp
            height = (height == "" ? "mystery" : height)
        end
        
        puts "Enter student's planet, dimension or realm of origin:"
        origin = gets.chomp
        origin = (origin == "" ? "unknown origins" : origin)
        
        puts "Please enter student's favourite colour:"
        colour = gets.chomp
        colour = (colour == "" ? "probably purple" : colour)
        
        add_more = ""
        until add_more == "yes" || add_more == "no"
            puts "Would you like to add another student? (yes/no)"
            add_more = gets.chomp.downcase
        end

        students << {name: name, cohort: cohort, height: height, origin: origin, colour: colour}
        
        name = ""
        cohort_str = "month"
        height = ""
    end
   
    students
end

# create a method to ask if names should be filtered by a letter
def print_letter_filter
    filter_letter = ""
    until filter_letter == "yes" || filter_letter == "no"
        puts "Would you only like to show students starting with a specific letter? (yes/no)"
        filter_letter = gets.chomp.downcase
    end
    if filter_letter == "yes"
        until filter_letter =~ /[a-zA-Z]/ && filter_letter.length == 1
            puts "What letter would you like to show?"
            filter_letter = gets.chomp
        end
    end
    filter_letter.upcase
end

# create methods to print each section
def print_header
    puts "The students of Villains Academy".center(60)
    puts "-------------------------------".center(60)
end

def print(students, letter)
    i = 0 
    while i < students.length
        if letter == "NO" && students[i][:name].length < 12
            puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(60)
            puts "standing #{students[i][:height]}cm tall and hailing from #{students[i][:origin]}".center(60)
            puts "their favourite colour is #{students[i][:colour]}".center(60)
        elsif students[i][:name][0].upcase == letter && students[i][:name].length < 12
            puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(60)
            puts "standing #{students[i][:height]}cm tall and hailing from #{students[i][:origin]}".center(60)
            puts "their favourite colour is #{students[i][:colour]}".center(60)
        else
            puts "---------".center(60)
            puts "#{i + 1}. ---student not shown---".center(60)
            puts "---------".center(60)
        end
        puts "---".center(60)
        i += 1
    end
end

def print_footer(students)
    puts "Overall we have #{students.count} great students".center(60)
    puts "-------------------------------".center(60)
end

# call the methods
students = input_students
letter = print_letter_filter
print_header
print(students, letter)
print_footer(students)