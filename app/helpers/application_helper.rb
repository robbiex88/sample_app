module ApplicationHelper
	# this is available in ALL views, as it's in appicatyion helper
	# Hartl ch4, returns full title on a per-page basis

	def full_title(page_title = '')
		base_title = "Ruby on Rails Tutorial Sample App"
		
		if page_title.empty? 	# page title is overwritten if passed in, otherwise blank
			base_title			# this is an 'Implicit Return'
		else
			page_title + " | " + base_title
		end
	end

  # Returns the Gravatar for the given user.
  # Rails book uses a more complicated method definition, but this works and is easier to read:
  # def gravatar_for(user, size: 80)
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end