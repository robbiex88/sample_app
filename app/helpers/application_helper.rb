module ApplicationHelper
	# this is available in ALL views, as it's in appicatyion helper
	# Hartl ch4, returns full title on a per-page basis

	def full_title(page_title = '')
		base_title = "Ruby on Rails Tutorial Sample App"
		
		if page_title.empty? 				# page title is overwritten if passed in, otherwise blank
			base_title								# this is an 'Implicit Return'
		else
			page_title + " | " + base_title
		end
	end
end