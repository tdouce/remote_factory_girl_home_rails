module RemoteFactoryGirlHomeRails
  class HomeController < ApplicationController 

    skip_before_filter *RemoteFactoryGirlHomeRails.skip_before_filter
    
    def create 
      if RemoteFactoryGirlHomeRails.enabled?
        factory = FactoryGirl.create(factory(params), attributes(params))
        render json: factory
      else
        forbidden = 403
        render json: { status: forbidden }, status: forbidden 
      end
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
