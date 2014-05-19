require 'spec_helper'

describe Believer do

		before(:each) do
	      @attr = { :firstname => "Example", 
	      	        :lastname => "Madagascar", 
	      	        :email => "believe@example.com", 
	      	        :password => "aberdeen", 
	      	        :password_confirmation => "aberdeen" }
	    end 

	    it "should create a new instance given valid attributes" do
	    	Believer.create!(@attr)
	    end

	    it "should require a firstname" do
	    	no_firstname_believer = Believer.new(@attr.merge(:firstname => ""))
            no_firstname_believer.should_not be_valid
	    end

	    it "should require a lastname" do
	    	no_lastname_believer = Believer.new(@attr.merge(:lastname => ""))
	    	no_lastname_believer.should_not be_valid
	    end

	    it "should require an email address" do
	    	no_email_believer = Believer.new(@attr.merge(:email => ""))
	    	no_email_believer.should_not be_valid
	    end

	    it "should reject firstnames that are too long" do
	    	long_firstname = "a" * 26
	    	long_firstname_believer = Believer.new(@attr.merge(:firstname => long_firstname))
	    	long_firstname_believer.should_not be_valid
	    end

	    it "should reject lastnames that are too long" do
	    	long_lastname = "a" * 26
	    	long_lastname_believer = Believer.new(@attr.merge(:lastname => long_lastname))
	    	long_lastname_believer.should_not be_valid
	    end

	    it "should accept valid email addresses" do
	    	addresses = %w[believer@foo.com THE_USER@foo.bar.org first.last@foo.jpg]
	    	addresses.each do |address|
	    		valid_email_believer = Believer.new(@attr.merge(:email => address))
	    		valid_email_believer.should be_valid
	        end
	    end

	    it "should reject invalid email addresses" do
	    	addresses = %w[user@foo,com user_at_foo.org cantina.believer@mail. cantina.looy@metinaa,fayy cabrit@ger>t]
	    	addresses.each do |address|
	    		invalid_email_believer = Believer.new(@attr.merge(:email => address))
	    		invalid_email_believer.should_not be_valid
	    	end
	    end

	    it "should reject duplicate email addresses" do
	    	Believer.create!(@attr)
	    	believer_with_duplicate_email = Believer.new(@attr)
	    	believer_with_duplicate_email.should_not be_valid
	    end

	    it "should reject email addresses identical even with different character cases" do
	    	upcased_email = @attr[:email].upcase
	    	Believer.create!(@attr.merge(:email => upcased_email))
	    	believer_with_duplicate_email = Believer.new(@attr)
	    	believer_with_duplicate_email.should_not be_valid
	    end

	    describe "password validations" do
	    	it "should require a password" do
	    		Believer.new(@attr.merge(:password => "", :password_confirmation=> ""))
	    		should_not be_valid
	    	end

	    	it "should require a matching password confirmation" do
	    		Believer.new(@attr.merge(:password_confirmation => "invalid"))
	    		should_not be_valid
	    	end

	    	it "should reject short passwords" do
	    		short = "a" * 5
	    		hash = @attr.merge(:password => short, :password_confirmation => short)
	    		Believer.new(hash).should_not be_valid
	    	end

	    	it "should reject long passwords" do
	    		long = "a" * 21
	    		hash = @attr.merge(:password => long, :password_confirmation => long)
                Believer.new(hash).should_not be_valid
            end
	    end

	    describe "password encryption" do
	    	before (:each) do
	    		@believer = Believer.create!(@attr)
	        end

	        it "should have an encrypted password attribute" do
	        	@believer.should respond_to(:encrypted_password)
	        end

	        it "should set the encrypted password" do
	        	@believer.encrypted_password.should_not be_blank
	        end

	        describe "has_password? method"  do

	        	it "should be true if the passwords match" do
	        		@believer.has_password?(@attr[:password]).should be_true
	        	end

	        	it "should be false if the passwords don't match" do
	        		@believer.has_password?("invalid").should be_false
	        	end

	        	describe "authenticate method" do

	        		it "should return nil on email/password mismatch" do
	        			wrong_password_believer = Believer.authenticate(@attr[:email], "wrongpass")
	        			wrong_password_believer.should be_nil
	        		end

	        		it "should return nil for an email address with no believer" do
	        			nonexistent_believer = Believer.authenticate("cils@magic.com", @attr[:password])
	        			nonexistent_believer.should be_nil
	        	    end

	        	    it  "should return the believer on email/password match" do
	        	    	matching_believer = Believer.authenticate(@attr[:email], @attr[:password])
	        	    	matching_believer.should == @believer
	        	    end
                end
            end
	    end
end
