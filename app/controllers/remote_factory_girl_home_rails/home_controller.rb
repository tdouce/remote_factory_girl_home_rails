module RemoteFactoryGirlHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteFactoryGirlHomeRails.skip_before_filters
    
    def create 
      factory = FactoryGirl.create(params['factory'].to_sym, params['attributes'])
      render json: factory
    end
  end
end
