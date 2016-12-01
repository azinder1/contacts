class Contact
  attr_reader(:first_name, :last_name, :company,:job_title)
  @@contacts=[]

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @company = attributes.fetch(:company)
    @job_title = attributes.fetch(:job_title)
    @id = @@contacts.length + 1
    @contact_mailing_addresses= []
    @contact_email_addresses = []
    @contact_phone_numbers = []
  end

  def id
    @id
  end

  def self.all
    @@contacts
  end

  def save
    @@contacts.push(self)
  end

  def self.clear
    @@contacts = []
  end

  def add_mailing_address(address)
    @contact_mailing_addresses.push(address)
  end

  def add_email_address(address)
    @contact_email_addresses.push(address)
  end

  def add_phone_number(number)
    @contact_phone_numbers.push(number)
  end

  def self.find(id)
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id.to_i())
        found_contact = contact
      end
    end

    found_contact
  end
end
