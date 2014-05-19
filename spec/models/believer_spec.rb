require 'spec_helper'

describe Believer do

		before(:each) do
	      @attr = { :firstname => "Example", :lastname => "Madagascar", :email => "believe@example.com" }
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
end
