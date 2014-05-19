module SessionsHelper

	def sign_in(believer)
		cookies.permanent.signed[:remember_token] = [believer.id, believer.salt]
		current_believer = believer
	end

	def current_believer=(believer)
		@current_believer = believer
	end

	def current_believer
		@current_believer ||= believer_from_remember_token
	end

	def current_believer?(believer)
		believer == current_believer
	end

	def signed_in?
		!current_believer.nil?
    end   

    def sign_out
    	cookies.delete(:remember_token)
    	current_user = nil
    end

    def deny_access
    	store_location
    	redirect_to signin_path, :notice => "Please sign in to me the visionaries."
    end

    def redirect_back_or(default)
    	redirect_to(session[:return_to] || default)
    	clear_return_to
    end

   private
  
	def believer_from_remember_token
		Believer.authenticate_with_salt(*remember_token)
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end

	def clear_return_to
		session[:return_to] = nil
    end
end
