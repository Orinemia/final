module UsersHelper # For images on the user page. Orinemia Ajulo
	# Returns the Gravatar (http://gravatar.com/) for the user identified by user's email address.
	def gravatar_for(user, options = { :size => 50})
		gravatar_image_tag(user.email.downcase, :alt => user.firstname,
			                                    :class => 'gravatar',
			                                    :gravatar => options)
		
	end
end
