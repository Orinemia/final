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

	def signed_in?
		!current_believer.nil?
    end   

    def sign_out
    	cookies.delete(:remember_token)
    	current_user = nil
    end

 private
  
	def believer_from_remember_token
		Believer.authenticate_with_salt(*remember_token)
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end
end
