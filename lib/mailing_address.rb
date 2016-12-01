class MailingAddress
  attr_reader(:street_address, :city, :state, :type)
  @@mailing_addresses=[]

  def initialize(attributes)
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @type = attributes.fetch(:type)
    @id = @@mailing_addresses.length + 1
  end
  def id
    @id
  end
  def self.all
    @@mailing_addresses
  end
  def save
    @@mailing_addresses.push(self)
  end
  def self.clear
    @@mailing_addresses = []
  end

  def self.find(id)
    found_address = nil
    @@mailing_addresses.each() do |address|
      if address.id().eql?(id.to_i())
        found_address = address
      end
    end
    found_address
  end
end
