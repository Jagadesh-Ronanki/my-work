# creating static users db

users = [
{username: "user1", password: "pass1"},
{username: "user2", password: "pass2"},
{username: "user3", password: "pass3"}
]

def auth_user(user, psswd, user_db)
    user_db.each do |u|
	if u[:username] == user && u[:password] == psswd
	    return u
        end
    end
    return "[x] Credentials not found"
end
 
puts "Welcome to authenticator"
attempts = 1

while attempts < 4
    print "Username: "
    user = gets.chomp
    print "Password: "
    psswd = gets.chomp
    
    # check 
    auth_result = auth_user(user, psswd, users)
    puts auth_result
    
    # reattempt
    puts "Press n to quit or any other key to continue: "
    input = gets.chomp.downcase
    break if input == "n"
    attempts += 1
end

puts "Exceeded maximum number of attempts -_-" if attempts == 4
