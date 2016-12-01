require('pry-nav')
require('rspec')
require('contact')
require('email_address')
require('phone_info')
require('mailing_address')

describe(Contact) do
  before() do
    Contact.clear()
    @contact1 = Contact.new({:first_name => "Greatest", :last_name => "Ever", :company => "Skynet", :job_title => "Terminator"})
    @contact1.save()

    @contact2 = Contact.new(:first_name => "Captain", :last_name => "Kirk", :company => "Federation Government", :job_title => "Captain of Starship Enterprise")
    @contact2.save()
  end

  describe('#initialize') do
    it('can retrieve info for new contact') do
      expect(@contact1.first_name).to eq("Greatest")
    end
  end
  describe('#find') do
    it('it can find unique id from contact array') do
      expect(Contact.find(@contact2.id())). to eq(@contact2)
    end
  end
  describe('#add_email_address') do
    it('adds a new email address to contact') do
      test_email_address = EmailAddress.new({:email_address => "hsimpson@burns.com", :type => "work"})
      @contact1.add_email_address(test_email_address)
      expect(@contact1.contact_email_addresses()). to(eq([test_email_address]))
    end
  end
end
