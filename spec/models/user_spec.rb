require 'spec_helper' # Orinemia Ajulo 

#Tests for validation

describe User do

	before do 
		 @user = User.new(firstname: "Example", lastname: "User", username: "hubbabubba", email: "user@example.com", password: "partytoextreme", password_confirmation: "partytoextreme")
	end

	subject { @user }

	it { should respond_to(:firstname) }
	it { should respond_to(:lastname) }
	it { should respond_to(:username) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:admin) }
    it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }

	it { should be_valid }
    it { should_not be_admin }

	it { should be_valid }
    
    describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

	describe "when first name is not present" do
		before { @user.firstname = " " }
		it { should_not be_valid }
	end

	describe "when last name is not present" do
		before { @user.lastname = " " }
		it { should_not be_valid }
	end

	describe "when user name is not present" do
		before { @user.username = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when first name is too long" do
		before { @user.firstname = "a" * 16 }
		it { should_not be_valid }
	end

	describe "when last name is too long" do
		before { @user.lastname = "a" * 16 }
		it { should_not be_valid }
	end

	describe "when user name is too long" do
		before { @user.username = "a" * 16 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@test,com user_at_test.com name.user@testcom. test@say_wrong.com user@test+say.com]
			addresses.each do |invalid_address|
			   @user.email = invalid_address
			   expect (@user).should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@test.COM M_LIGHT-TIME@t.n.org test.best@break.co.uk t+a@veggie.split]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect (@user).should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid}
	end

	describe "when password is not present" do
		before do
			@user = User.new(firstname: "Example", lastname: "User", username: "hubbabubba", email: "user@example.com", password: " ", password_confirmation: " ")
		end
	    it { should_not be_valid}
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "remember token" do
		before { @user.save }
		its(:remember_token) { should_not be_blank }
    end

    describe "with admin attribute set to 'true'" do
         before do
          @user.save!
          @user.toggle!(:admin)
        end

         it { should be_admin }


         it { should respond_to(:password_confirmation) }
         it { should respond_to(:remember_token) }
         it { should respond_to(:authenticate) }
     end
end
