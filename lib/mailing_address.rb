class MailingAddress
  attr_reader(:street_address, :city, :state, :type)
  @@addresses=[]

  def initialize(attributes)
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @type = attributes.fetch(:type)
    @id = @@addresses.length + 1
  end
  def id
    @id
  end
  def self.all
    @@addresses
  end
  def save
    @@addresses.push(self)
  end
  def self.clear
    @@addresses = []
  end

  def self.find(id)
    found_address = nil
    @@addresses.each() do |address|
      if address.id().eql?(id.to_i())
        found_address = address
      end
    end
    found_address
  end
end
