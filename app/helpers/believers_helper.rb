module BelieversHelper

	def gravatar_for(believer, options = { :size => 70})
	  gravatar_image_tag(believer.email.downcase,  :alt => believer.firstname,
	  	                                           :class => 'gravatar',
	  	                                           :gravatar => options)
    end
end
