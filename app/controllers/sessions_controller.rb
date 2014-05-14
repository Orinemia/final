class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
  		    redirect_to user
			# The user sign's in and is redirected back to the sign in page
		else
			flash.now[:error] = 'Invalid email/password combination' # This works ... jut needed to add now.
		    render 'new'
		end
	end

	def destroy
       sign_out
       redirect_to root_url
    end
end
