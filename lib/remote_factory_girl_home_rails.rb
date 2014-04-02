require "remote_factory_girl_home_rails/engine"

module RemoteFactoryGirlHomeRails

  OFF     = false
  ON      = true
  @enable = OFF

  mattr_accessor :skip_before_filter

  def self.skip_before_filters
    skip_before_filter.present? ? [skip_before_filter].flatten.map {|a| a.to_sym} : nil
  end

  def self.enable!
    @enable = ON 
  end

  def self.disable!
    @enable = OFF 
  end

  def self.enabled?
    @enable == ON 
  end

  def self.reset
    @enable = OFF 
  end
end
