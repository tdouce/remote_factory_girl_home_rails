require 'spec_helper'

describe RemoteFactoryGirlHomeRails::HomeController do

  routes { RemoteFactoryGirlHomeRails::Engine.routes }

  describe '#create' do
    it 'should skip :authentication and :another_authentication methods defined in ApplicationController' do
      FactoryGirl.stub(:create)
      post :create, {:factory => 'user', :attributes => {:first_name => 'Sam', :last_name  => 'Iam'}}
      expect(response).to_not redirect_to("/401.html")
    end
  end
end

