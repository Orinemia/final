class Believer < ActiveRecord::Base
	attr_accessible :firstname, :lastname, :email

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :firstname, 
	          :presence => true,
	          :length => { :maximum => 25 } 

    validates :lastname,  
              :presence => true,
	          :length => { :maximum => 25 }

	validates :email,     :presence => true,
	          :format => { :with => email_regex },
	          :uniqueness => { :case_sensitive => false }
end
