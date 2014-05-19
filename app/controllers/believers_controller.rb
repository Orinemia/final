class BelieversController < ApplicationController
  def new
  	@believer = Believer.new
  	@title = "Sign Up"
  end

  def show
  	@believer = Believer.find(params[:id])
  	@title = @believer.firstname
  end

  def create
  	@believer = Believer.new(params[:believer])
  	if @believer.save
  		flash[:success] = "Meet the visionaries all in one place"
  		redirect_to @believer
  		ContactNotifier.message_email(@believer).deliver
    else
    	@title ="Sign Up"
    	render 'new'
    end
  end
end
