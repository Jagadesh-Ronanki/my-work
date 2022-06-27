#require 'bundler/inline'

#gemfile true do
#  source 'http://rubygems.org'
#  gem 'bcrypt'
#end

module Crypt
  require 'bcrypt'
  puts "Module crypt activated"

  def create_hash_digest(psswd)
    BCrypt::Password.create(psswd)
  end

  def verify_hash_digest(psswd)
    BCrypt::Password.new(psswd)
  end

  def create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  def authenticate_user(username, pssed, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == psswd
        return user_record
      end
    end
    "Credentials were not correct"
  end
end