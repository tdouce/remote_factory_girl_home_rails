require 'spec_helper'

class FactoryGirl
  def self.create(factory, opts = {})
    true
  end
end

describe RemoteFactoryGirlHomeRails::HomeController do

  routes { RemoteFactoryGirlHomeRails::Engine.routes }

  describe '#create' do
    it 'should skip :authentication and :another_authentication methods defined in ApplicationController' do
      FactoryGirl.stub(:create)
      post :create, {:factory => 'user', :attributes => {:first_name => 'Sam', :last_name  => 'Iam'}}
      expect(response).to_not redirect_to("/401.html")
    end

    it 'should return status code 403 when RemoteFactoryGirlHomeRails is not enabled' do
      post :create, {}
      expect(response.status).to eq(403)
    end

    it 'should return status code 200 when RemoteFactoryGirlHomeRails is enabled' do
      controller.stub(:factory)
      FactoryGirl.stub(:create)
      RemoteFactoryGirlHomeRails.enable!
      post :create, {}
      expect(response.status).to eq(200)
    end
  end
end

