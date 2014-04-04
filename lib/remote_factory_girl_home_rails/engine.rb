module RemoteFactoryGirlHomeRails
  class Engine < ::Rails::Engine
    isolate_namespace RemoteFactoryGirlHomeRails

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.assets false
      g.helper false
    end

    config.remote_factory_girl_home_rails = ActiveSupport::OrderedOptions.new

    initializer "remote_factory_girl_home_rails.environment" do |app|
      options = app.config.remote_factory_girl_home_rails
      options.skip_before_filter ||= nil
      options.enable ||= false 
    end
  end
end
