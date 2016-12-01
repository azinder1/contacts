class EmailAddress
  attr_reader(:email_address, :type)
  @@email_addresses=[]

  def initialize(attributes)
    @email_address = attributes.fetch(:email_address)
    @type = attributes.fetch(:type)
    @id = @@email_addresses.length + 1
  end
  def id
    @id
  end
  def self.all
    @@email_addresses
  end
  def save
    @@email_addresses.push(self)
  end
  def self.clear
    @@email_addresses = []
  end

  def self.find(id)
    found_address = nil
    @@email_addresses.each() do |address|
      if address.id().eql?(id.to_i())
        found_address = address
      end
    end
    found_address
  end
end
