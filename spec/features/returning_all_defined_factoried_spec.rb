require 'spec_helper'

describe 'Returning all defined factories' do
  before do
    RemoteFactoryGirlHomeRails.configure do |config|
      config.skip_before_filter = [:authenticate, :another_authentication]
      config.enable = true
    end
  end

  it 'should return a list of available factories' do
    get remote_factory_girl_home_rails.home_index_path
    expect(response.body).to eq('{"factories":["user"]}')
  end
end
