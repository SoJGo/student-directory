# 8. Write a short program that reads its own source code and prints it on the screen

def print_my_own_insides
    File.open($0, "r") do |me|
        me.readlines.each do |line|
            puts line
        end
    end
end

print_my_own_insides