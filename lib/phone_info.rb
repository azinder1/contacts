class PhoneNumber
  attr_reader(:area_code, :phone_number, :type)
  @@phone_numbers=[]

  def initialize(attributes)
    @area_code = attributes.fetch(:area_code)
    @phone_number = attributes.fetch(:phone_number)
    @type = attributes.fetch(:type)
    @id = @@phone_numbers.length + 1
  end

  def id
    @id
  end

  def self.all
    @@phone_numbers
  end

  def save
    @@phone_numbers.push(self)
  end

  def self.clear
    @@phone_numbers = []
  end

  def self.find(id)
    number_found = nil
    @@phone_numbers.each() do |number|
      if number.id().eql?(id.to_i())
        number_found = number
      end
    end
    number_found
  end
end
