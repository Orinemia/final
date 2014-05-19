require 'spec_helper'

describe "Believers" do

 describe "signup" do

    describe "success" do

    	it "should make a new believer" do
    	  lambda do
    	  	visit signup_path

    	  	fill_in "Name",                :with => "Uncleduu"
    	  	fill_in "Lastname",            :with => "Faartingg"
    	  	fill_in "Email",               :with => "believer@aberdeen.com"
    	  	fill_in "Password",            :with => "medusaa"
            fill_in "confirm_password",  :with => "medusaa"
            click_button
            response.should have_selector("div.flash.success", :content => "welcome")
            response.should render_template('believers/show')
        end.should change(Believer, :count).by(1)
      end
    end



    describe "failure" do

  		it "should not make a new user" do
        lambda do
  				   visit signup_path

  				   fill_in "Firstname",       :with => ""
  				   fill_in "Lastname",        :with => ""
  				   fill_in "Email",           :with => ""
  				   fill_in "Password",        :with => ""
  				   fill_in "Confirmation",    :with => ""
  				   click_button
  				   response.should render_template('believers/new')
  				   response.should have_selector("div#error_explanation")
  			 end.should_change(Believer, :count)
     end
   end
   
 end
end
