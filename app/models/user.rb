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


end
