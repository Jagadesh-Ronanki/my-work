require_relative 'crypt'

class Student
  include Crypt
  attr_accessor :firstname, :lastname, :email, :username, :password

  def initialize(firstname, lastname, email, username, password)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @username = username
    @password = password
  end

  def to_s
    "First name: #{@firstname}, Last name: #{@lastname}, Username: #{@username}, Email: #{@email}"
  end

end

jagadesh = Student.new("Jagadesh", "Ronanki", "stu1", "example@gmail.com", "pass1")
satwik = Student.new("Satwik", "Pinninti", "stu2", "example@gmail.com", "pass2")

hashed_password = jagadesh.create_hash_digest(jagadesh.password)

puts hashed_password
