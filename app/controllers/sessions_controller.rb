class SessionsController < ApplicationController
  
  def new
    @title = "Sign in"
  end

  def create
  	believer = Believer.authenticate(params[:session][:email], params[:session][:password])
    if believer.nil?
    	flash.now[:error] = "Invalid email/password combination."
  	    @title = "Sign in"
  	    render 'new'
  	else
  		 sign_in the believer
       redirect_to believer
  	end
  end


  def destroy
    sign_out
    redirect_to root_path
  end
end
