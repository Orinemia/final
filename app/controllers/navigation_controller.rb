class NavigationController < ApplicationController
  def home
  	@title = "Intro"
    #redirect_to signin_path #Redirects to /signin page
  end

  def about
  	@title = "About"
  end

  def contact
  	@title = "Contact"
  end

  def intro
  	@title = "Intro"
  end
end
