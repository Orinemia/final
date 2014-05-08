require 'spec_helper'  # By Orinemia Ajulo

describe "User pages" do
  
    subject { page }

    describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit user_path(user) }

      it { should have_content (user.firstname) }
      it { should have_title(user.firstname) }
      it { should have_content (user.lastname) }
      it { should have_title(user.lastname) }
      it { should have_content (user.username) }
      it { should have_title(user.username) }
    end
    
    describe "Sign up page" do
       before { visit signup_path }

       it { should have_content ( 'Sign up') }
    end

    describe "signup" do

       before { visit signup_path }

       let(:submit) { "Create my account" }

       describe "with invalid information" do
         it "should not create a user" do
           expect { click_button submit }.not_to change(User, :count)
         end
       end

    describe "with valid information" do
         before do
          fill_in "First Name",                   with: "Example"
          fill_in "Last Name",                    with: "User" 
          fill_in "User Name",                    with: "hubbabubba"   
          fill_in "Email",                        with: "user@Example.com"
          fill_in "Password",                     with: "foobar"
          fill_in "Re-Type password to confirm",  with: "foobar"
         end

         it "should create a user" do
           expect { click_button submit }.to change(User, :count).by(1)
         end
       end
    end

    describe "edit" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit edit_user_path(user) }

      describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
      end

      describe "with invalid information" do
      before { click_button "Save changes" }
      end
      it { should have_content('error') }
    end

    describe "edit" do
       let(:user) { FactoryGirl.create(:user) }
        before do
           sign_in user
          visit edit_user_path(user)
        end
  
        describe "with valid information" do
             let(:new_firstname)  { "New Firstname" }
             let(:new_email) { "new@example.com" }
             before do
               fill_in "Firstname",      with: new_firstname
               fill_in "Lastname",        with: new_lastname 
               fill_in "Username",        with: new_username 
               fill_in "Email",            with: new_email
               fill_in "Password",         with: user.password
               fill_in "Confirm Password", with: user.password
               click_button "Save changes"
           end

           it { should have_title(new_name) }
           it { should have_selector('div.alert.alert-success') }
           it { should have_link('Sign out', href: signout_path) }
           specify { expect(user.reload.firstname).to  eq new_firstname }
           specify { expect(user.reload.email).to eq new_email }
       end
    end
end 