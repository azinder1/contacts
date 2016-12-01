require('pry-nav')
require('rspec')
require('mailing_address')

describe(MailingAddress) do
  before() do
    MailingAddress.clear()
    @addresshome = MailingAddress.new({:street_address => "742 Evergreen Terrace", :city => "Springfield", :state => "Oregon", :type => "Home"})
    @addresshome.save()

    @addresswork = MailingAddress.new({:street_address => "666 Dead End Harbor", :city => "Cape Fear", :state => "Oregon", :type => "Work"})
    @addresswork.save()
  end

  describe('#initialize') do
    it('can retrieve info for new address') do
      expect(@addresshome.street_address).to eq("742 Evergreen Terrace")
    end
  end

  describe('#find') do
    it('it can find unique id from address array') do
      expect(MailingAddress.find(@addresswork.id())). to eq(@addresswork)
    end
  end
end
