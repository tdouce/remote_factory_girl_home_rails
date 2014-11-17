require 'remote_factory_girl_home_rails/serializer.rb'

describe RemoteFactoryGirlHomeRails::Serializer do

  subject { RemoteFactoryGirlHomeRails::Serializer }
  let(:user) { double('User') }

  describe '.serialize' do
    it 'should return ' do
      expect(user).to receive(:attributes)
      subject.serialize(user)
    end
  end
end
