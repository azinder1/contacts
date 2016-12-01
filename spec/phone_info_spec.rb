require('pry-nav')
require('rspec')
require('phone_info')

describe(PhoneNumber) do
  before() do
    PhoneNumber.clear()
    @numberhome = PhoneNumber.new({:phone_number => "867-5301", :area_code => "555", :type => "Home"})
    @numberhome.save()

    @numberwork = PhoneNumber.new({:phone_number => "555-5555", :area_code => "931", :type => "Work"})
    @numberwork.save()
  end

  describe('#initialize') do
    it('can retrieve info for new address') do
      expect(@numberhome.phone_number).to eq("867-5301")
    end
  end

  describe('#find') do
    it('it can find unique id from address array') do
      expect(PhoneNumber.find(@numberwork.id())). to eq(@numberwork)
    end
  end
end
