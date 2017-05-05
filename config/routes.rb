Rails.application.routes.draw do
  
  get 'users/new'

  # defining root route creates named routes that allow user to refer to routes by name
  # rather than the raw URL.
  
  root 'static_pages#home'
  # even though this is the root of the app, 
  # we still need to list the get request for static_pages#home here
  get '/home', to: 'static_pages#home'


  # common convention of using the _path form except when doing redirects, where we’ll use the _url form.
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'signup', to: 'users#new'
  # note this can be written like this, too:
  # get 'static_pages/home'
  # This new pattern routes a GET request for the URL /help to the help action in the Static Pages controller
  # And also removes the static_pages portion of the URL
  # So, help routes like this:
  # help_path -> '/help'
  # help_url  -> 'http://www.example.com/help'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
