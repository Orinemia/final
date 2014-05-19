class BelieversController < ApplicationController
  before_filter :authenticate, :only => [ :index, :edit, :update ]
  before_filter :correct_believer, :only => [ :edit, :update ]

  def index
    @title = "All Users"
    @believers = Believer.all? 
  end

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
      sign_in @believer
  		flash[:success] = "Meet the visionaries all in one place"
  		redirect_to @believer
  		ContactNotifier.message_email(@believer).deliver
    else
    	@title ="Sign Up"
    	render 'new'
    end
  end

  def edit
    @title = "Edit User"
  end

  def update
    @believer = Believer.find(params[:id])
    if @believer.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @believer
    else
      @title = "Edit User"
      render 'edit'
    end
  end

private

  def authenticate
     deny_access unless signed_in?
  end

  def correct_believer
    @believer = Believer.find(params[:id])
    redirect_to(root_path) unless current_believer? (@believer)
  end
end
