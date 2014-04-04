RemoteFactoryGirlHomeRails.configure do |config|
  config.skip_before_filter = [:authenticate, :another_authentication]
end
