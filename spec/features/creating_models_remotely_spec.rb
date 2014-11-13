require 'spec_helper'

describe 'Creating models remotely' do
  before do
    RemoteFactoryGirlHomeRails.configure do |config|
      config.skip_before_filter = [:authenticate, :another_authentication]
      config.enable = true
    end
  end

  it 'should return a JSON response' do
    post "/remote_factory_girl_home_rails/home", {'factory' => 'user', 'attributes' => {'first_name' => 'Sam'}}
    expect(response.body).to eq('{"first_name":"Sam"}')
  end
end
