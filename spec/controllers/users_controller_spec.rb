require 'spec_helper'

describe UsersController do
   render_views

   describe "GET 'show'" do

     it "should have the right title" do
       get :show, :id => @user
       response.should have_selector ("title", :content => @user.firstname)
     end

     it "should include the user's firstname" do
       get :show, :id => @user
       response.should have_selector ("h1", :content => @user.firstname)
     end

     it "should have a profile image" do
       get :show, id => @user
       response.should have_selector ("h1>img", :class => "gravatar")
     end
    end
end
