class User < ApplicationRecord
	# can also be written as:
	# 	validates(:name, presence: true)
	validates :name, presence: true
	validates :name, length: {in: 3..25 } #in specifies range
	# validates :name, length: {minimum: 5, maximim: 25} #idk if this works



	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, 
				length: {in: 5..25},
				format: {with: VALID_EMAIL_REGEX},
				uniqueness: {case_sensitive: false} # note this is NOT at the DB level, create a DB index on email address to do this
	# http://stackoverflow.com/questions/22993545/ruby-email-validation-with-regex#22994329
	# turns out, there's RFC 5322, which describes standard email addresses

	# can also be written as:
	# before_save { self.email = email.downcase }
	before_validation(on: :create) do
		self.email = email.downcase
	end

	has_secure_password
	validates :password, presence: true, length: {minimum: 5, maximum: 10} # can also do this -> length: {in: 5..10}



	# The method for authenticating users will be to take a submitted password, hash it, and compare the result to the hashed value stored in the database. If the two match, then the submitted password is correct and the user is authenticated. By comparing hashed values instead of raw passwords, we will be able to authenticate users without storing the passwords themselves. This means that, even if our database is compromised, our users’ passwords will still be secure.
end
