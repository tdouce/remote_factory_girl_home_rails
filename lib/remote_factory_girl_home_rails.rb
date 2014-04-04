require "remote_factory_girl_home_rails/engine"

module RemoteFactoryGirlHomeRails

  OFF = false
  ON  = true

  def self.skip_before_filter
    filters = config.skip_before_filter
    filters.present? ? [filters].flatten.map(&:to_sym) : nil
  end

  def self.config(config = RemoteFactoryGirlHomeRails::Engine.config.remote_factory_girl_home_rails)
    config
  end

  def self.configure
    yield config
  end

  def self.enable!
    config.enable = ON 
  end

  def self.disable!
    config.enable = OFF 
  end

  def self.enabled?
    config.enable == ON
  end

  def self.reset
    config.enable = OFF
    config.skip_before_filter = nil
  end
end
