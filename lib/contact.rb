class Contact
  attr_reader(:first_name, :last_name, :company,:job_title)
  @@contacts=[]

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @company = attributes.fetch(:company)
    @job_title = attributes.fetch(:job_title)
    @id = @@contacts.length + 1
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
