require 'capybara/poltergeist'

Evergreen.configure do |config|
  config.driver = :poltergeist
  config.public_dir = 'public_html'
  config.template_dir = 'templates'
  config.spec_dir = 'spec'
end