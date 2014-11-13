require 'spec_helper'
require 'active_model_serializers'

describe 'Creating models remotely' do
  before do
    RemoteFactoryGirlHomeRails.configure do |config|
      config.skip_before_filter = [:authenticate, :another_authentication]
      config.enable = true
    end
  end

  it 'should return a JSON response' do
    post "/remote_factory_girl_home_rails/home", {'factory' => 'user', 'attributes' => {'first_name' => 'Sam'}}
    expect(JSON.parse(response.body)['first_name']).to eq('Sam')
  end
end
