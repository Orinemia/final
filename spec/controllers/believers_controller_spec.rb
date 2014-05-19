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
             get :show,  :id => @believer
             response.should have_selector("title", :content => @believer.firstname )
         end

         it "should include the believer's name" do
         	get :show, :id => @believer
         	response.should have_selector("h1", :content => @believer.firstname)
         end

         it "should include the believer's name" do
         	get :show,  :id => @believer
         	response.should have_selector("h1>img", :class => "gravatar")
         end

         describe "GET 'new' " do

         	it "should be successful" do
         		get :new
         		response.should be_success
         	end

         	it "should have the right title" do
         		get :new
         		response.should have_selector("title", :content => "Signup")
         	end
         end
       end

     describe "POST 'create'" do

          describe "failure" do

                before (:each) do
                	@attr = { :firstname =>"", :lastname => "", :email =>"", :password => "", :password_confirmation => "" }
                end

                it "should not create a believer" do
                	lambda do
                		post :create,  :believer => @attr
                	end.should_not change(Believer, :count)
                end

                it "shoould have the right title" do
                	post :create, :believer => @attr
                	response.should render_template('new')
                end
           end

           describe "success" do

           	    before(:each) do
           	    	@attr = { :firstname => "Example", :lastname => "Beeeelll", :email => "foo@barti.com",
           	    	          :password => "gertribb", :password_confirmation => "gertribb" }
           	    end

           	    it "should create a believer" do
           	    	lambda do
           	    		post :create, :believer => @attr
           	    	end.should change(Believer, :count).by(1)
           	    end

           	    it "should redirect to the believer show page" do
           	    	post :create, :believer => @attr
           	    	response.should redirect_to(believer_path(assigns(believer)))
           	    end

           	    it "should have a welcome message" do
           	    	post :create, :believer => @attr
           	    	flash[:success].should = ~/Meet the Visionaries all in one place!/i 
           	    end

          end
        end


end
