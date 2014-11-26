require 'spec_helper'

describe RemoteFactoryGirlHomeRails do

  describe '.enable!' do
    it 'should return true when enabled' do
      RemoteFactoryGirlHomeRails.enable!
      expect(RemoteFactoryGirlHomeRails.enabled?).to be true
    end
  end

  describe '.enabled?' do
    it 'should return false when disabled' do
      expect(RemoteFactoryGirlHomeRails.enabled?).to be false
    end
  end

  describe '.disable!' do
    it 'should disable' do
      RemoteFactoryGirlHomeRails.enable!
      RemoteFactoryGirlHomeRails.disable!
      expect(RemoteFactoryGirlHomeRails.enabled?).to be false
    end
  end
end
