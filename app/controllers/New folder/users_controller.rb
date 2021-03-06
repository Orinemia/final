class UsersController < ApplicationController
  before_action :signed_in_user, only: [ :index, :edit, :update,]
  before_action :correct_user,   only: [ :edit, :update,]
  before_action :admin_user,     only: :destroy

  
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user  = User.find(params[:id])
    @title = @user.firstname
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)     
    if @user.save
      sign_in @user
       flash[:success] = "Now meet the Visionaries!" # should show on the page when user has successfully created an account.
       ContactNotifier.message_email(@user).deliver
       redirect_to @user
    else
       render 'new'
    end
  end
      
  

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  
private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

# Never trust parameters from the scary internet, only allow the white list through.
    
    def user_params
      params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
    end
    
    # Before filters
    def signed_in_user
      unless signed_in?
        store_location
         redirect_to signin_url,  notice: "Please Sign in."
      end 
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end