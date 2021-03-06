class Believer < ActiveRecord::Base
	attr_accessor  :password, :password_confirmation
	attr_accessible :firstname, :lastname, :email, :password, :password_confirmation

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

	          # Will create "password_confirmation" as virtual attribute.

	validates :password,  :presence => true,
	                      :confirmation => true,
	                      :length   => { :within => 6..20 } 

	
	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypt_password == encrypt(submitted_password)
    end

    def self.authenticate(email, submitted_password)
    	believer = find_by_email(email)
    	return nil if believer.nil?
    	return believer if believer.has_password?(submitted_password)
    end

	private

	    def self.authenticate_with_salt (id, cookie_salt)
		    believer = find_by_id(id)
		    (believer && believer.salt == cookie_salt) ? believer : nil
	    end

	   def encrypt_password
	   	 self.salt = make_salt if new_record?
	   	 self.encrypted_password = encrypt(password)
	   end

	   def encrypt (string)
	   	 secure_hash("#{salt}--#{string}")
	   end

	   def make_salt
	   	 secure_hash("#{Time.now.utc}--#{password}")
	   end

	   def secure_hash(string)
	     Digest::SHA2.hexdigest(string)
	   end
end
