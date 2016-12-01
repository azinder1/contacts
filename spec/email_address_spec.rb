require('pry-nav')
require('rspec')
require('email_address')

describe(EmailAddress) do
  before() do
    EmailAddress.clear()
    @emailhome = EmailAddress.new({:email_address => "homer@hotmail.com", :type => "home"})
    @emailhome.save()

    @emailwork = EmailAddress.new({:email_address => "hsimpson@burns.com", :type => "work"})
    @emailwork.save()
  end

  describe('#initialize') do
    it('can retrieve info for new email address') do
      expect(@emailhome.email_address).to eq("homer@hotmail.com")
    end
  end

  describe('#find') do
    it('it can find unique id from address array') do
      expect(EmailAddress.find(@emailwork.id())). to eq(@emailwork)
    end
  end
end
