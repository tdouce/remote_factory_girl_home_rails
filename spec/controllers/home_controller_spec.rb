require 'spec_helper'

class FactoryGirl
  def self.create(factory, opts = {})
    true
  end
end

describe RemoteFactoryGirlHomeRails::HomeController do

  routes { RemoteFactoryGirlHomeRails::Engine.routes }

  describe '#create' do
    describe "when '.skip_before_filter' methods are configured" do
      it 'should skip :authentication and :another_authentication methods defined in ApplicationController' do
        post :create, {'factory' => 'user', :attributes => {'first_name' => 'Sam'}}
        expect(response).to_not redirect_to('/401.html')
      end
    end

    describe 'when enabled' do

      before { RemoteFactoryGirlHomeRails.enable! }

      it 'should return status code 200' do
        post :create, {'factory' => 'user'}
        expect(response.status).to eq(200)
      end

      it 'should create a factory' do
        expect(FactoryGirl).to receive(:create).with(:user, {})
        post :create, {'factory' => 'user'}
      end
    end

    it 'should return status code 403 when RemoteFactoryGirlHomeRails is not enabled' do
      post :create, {}
      expect(response.status).to eq(403)
    end
  end
end

