module RemoteFactoryGirlHomeRails
  class Serializer
    def self.serialize(resource)
      resource.attributes
    end
  end
end
