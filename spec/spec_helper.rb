ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require File.expand_path("../dummy/spec/factories.rb",  __FILE__)

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include RSpec::Rails::RequestExampleGroup, type: :feature

  config.before(:each) do
    RemoteFactoryGirlHomeRails.reset
  end
end

def response_json(json)
  JSON.parse(json)
end
