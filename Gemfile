# Rob - Apr 27 2017
# Cribbed from hartl tutorial, ch3
# https://www.railstutorial.org/book/static_pages

source 'https://rubygems.org'

gem 'rails',        '5.0.1'
gem 'puma',         '3.4.0' # web server - replaced webrick - https://github.com/puma/puma
gem 'sass-rails',   '5.0.6' # SCSS rails integration        - https://github.com/rails/sass-rails
gem 'uglifier',     '3.0.0' # ruby wrapper / js compressor  - https://github.com/lautis/uglifier
gem 'coffee-rails', '4.2.1' # coffeescript rails integration
gem 'jquery-rails', '4.1.1' # javascript library + assets   - http://jquery.com/
gem 'turbolinks',   '5.0.1' # this is freaking neat         - https://github.com/turbolinks/turbolinks
# more on turbolinks:
# Turbolinks makes navigating your web application faster. Get the performance benefits of a single-page application without the added complexity of a client-side JavaScript framework. Use HTML to render your views on the server side and link to pages as usual. When you follow a link, Turbolinks automatically fetches the page, swaps in its <body>, and merges its <head>, all without incurring the cost of a full page load.


gem 'jbuilder',     '2.4.1' # DSL for making JSON structures  - https://github.com/rails/jbuilder

group :development, :test do
  gem 'sqlite3', '1.3.12' # mysql replacement
  gem 'byebug',  '9.0.0', platform: :mri # debugger for ruby 2  - https://github.com/deivid-rodriguez/byebug
end

group :development do
  gem 'web-console',           '3.1.1' # web based rails c?!    - https://github.com/deivid-rodriguez/byebug
  gem 'listen',                '3.0.8'
  gem 'spring',                '1.7.2'
  gem 'spring-watcher-listen', '2.0.0'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
end