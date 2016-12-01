require('pry-nav')
require('rspec')
require('contact')
require('email_address')
require('phone_info')
require('mailing_address')

describe(Contact) do
  before() do
    Contact.clear()
  end
  describe('#initialize') do
    it('can retrieve info for new contact') do
      contact1 = Contact.new({:first_name => "Greatest", :last_name => "Ever", :company => "Skynet", :job_title => "Terminator"})
      expect(contact1.first_name).to eq("Greatest")
    end
  end
  describe('#find') do
    it('it can find unique id from contact array') do
      contact1 = Contact.new({:first_name => "Greatest", :last_name => "Ever", :company => "Skynet", :job_title => "Terminator"})
      contact1.save()
      contact2 = Contact.new(:first_name => "Captain", :last_name => "Kirk", :company => "Federation Government", :job_title => "Captain of Starship Enterprise")
      contact2.save()
      expect(Contact.find(contact2.id())). to eq(contact2)
    end
  end
end
