class BelieversController < ApplicationController
  def new
  	@title = "Sign Up"
  end

  def show
  	@believer = Believer.find(params[:id])
  	@title = @believer.firstname
  end
end
