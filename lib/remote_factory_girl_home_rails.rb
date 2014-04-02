require "remote_factory_girl_home_rails/engine"

module RemoteFactoryGirlHomeRails
  mattr_accessor :skip_before_filter

  def self.skip_before_filters
    skip_before_filter.present? ? [skip_before_filter].flatten.map {|a| a.to_sym} : nil
  end
end
