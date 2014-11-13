module RemoteFactoryGirlHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteFactoryGirlHomeRails.skip_before_filter
    
    def create 
      if RemoteFactoryGirlHomeRails.enabled?
        resource = FactoryGirl.create(factory(params), attributes(params))
        render json: resource.attributes
      else
        forbidden = 403
        render json: { status: forbidden }, status: forbidden 
      end
    end

    def index
      factories = FactoryGirl.factories.map(&:name)
      render json: { factories: factories }
    end

    private

    def factory(params)
      params['factory'].to_sym
    end

    def attributes(params)
      params['attributes'] || {}
    end
  end
end
