require 'spec_helper'

describe BelieversController do
	render_views

      describe "GET 'show'" do
    

         before(:each) do
            @believer = Factory(:believer)
         end

         it "should be successful" do
    	     get :show, :id => @believer
    	     response.should be_success
         end

         it "should find the right believer" do
    	     get :show, :id => @believer
    	     assigns(:user).should == @believer
         end
     

         it "should have the right title" do
             get 'show'  :id => @believer
             response.should have_selector("title", :content => @believer.name )
         end

         it "should include the believer's name" do
         	get :show,  id => @believer
         	response.should have_selector("h1>img", :class => "gravatar")
         end
      end

end
