# create array of students
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]
# print a list of students under a heading
puts "The students of Villains Academy"
puts "-------------"
students.each { |student| puts student }
# print the student count
puts "Overall we have #{students.count} great students"