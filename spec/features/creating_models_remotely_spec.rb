require 'spec_helper'

describe 'Creating models remotely' do
  before do
    RemoteFactoryGirlHomeRails.configure do |config|
      config.skip_before_filter = [:authenticate, :another_authentication]
      config.enable = true
    end
  end

end
