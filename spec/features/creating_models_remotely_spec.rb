require 'spec_helper'

describe 'Creating models remotely' do
  before do
    RemoteFactoryGirlHomeRails.configure do |config|
      config.skip_before_filter = [:authenticate, :another_authentication]
      config.enable = true
    end
  end

  it 'should return a JSON response' do
    post remote_factory_girl_home_rails.home_index_path, {'factory' => 'user', 'attributes' => {'first_name' => 'Sam'}}
    expect(response_json(response.body)['first_name']).to eq('Sam')
  end
end
