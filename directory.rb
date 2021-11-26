# EXERCISES TO COMPLETE:
# fin 1 Print 1. 2. 3. etc in front of students names using each_with_index()
# fin 2 Modify to print only students starting with a specific letter
        # have asked user if they would like to filter and for letter
# fin 3 Modify your program to print student only if name length < 12
# 4 Rewrite each() using while or until loops
# 5 Add more information, hobbies, country of birth, height etc
# 6 Research the method center() of String class. Use to make output aligned
# 7 Ask for input for name and cohort in input_students method. Consider:
    # for empty values – add default
	# convert string to symbol
	# what if user makes a typo
# 8 Change the way users are displayed – grouped by cohorts 
    # (or any category from input?)
# 9 Change to print “...we have 1 student” not students when only one student
# 10 Find a method to replace chomp(), it will require passing arguments
# 11 Typo finding exercise – see branch exercise_11
# 12 Only print the list if there is at least one student
# ----------

# create method to get input of names
def input_students
    puts "Enter a students name, then press enter"
    puts "Please be aware entries with names over 11 characters will not be shown"
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
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students, letter)
    i = 0 
    while i < students.length
        if letter == "NO" && students[i][:name].length < 12
            puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
        elsif students[i][:name][0].upcase == letter && students[i][:name].length < 12
            puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
        else
            puts "#{i + 1}. ---student not shown---"
        end
        i += 1
    end
end

def print_footer(students)
    puts "Overall we have #{students.count} great students"
end

# call the methods
students = input_students
letter = print_letter_filter
print_header
print(students, letter)
print_footer(students)