require('./lib/contact')
require('./lib/email_address')
require('./lib/mailing_address')
require('./lib/phone_info')
require('./app')
require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require('pry-nav')

get('/') do
  erb(:index)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

post('/contacts') do
  new_contact = Contact.new({:first_name => params.fetch('first_name'), :last_name => params.fetch('last_name'), :company => params.fetch('company'), :job_title => params.fetch('job_title')})
  new_contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/new') do
  erb(:contact_form)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i)
  @contacts = Contact.all()
  erb(:contact)
end

get('/contacts/:id/phone_numbers/new') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:phone_form)
end

post('/contacts/:id/phone_numbers/new') do
  @contact = Contact.find(params.fetch('id').to_i)
  @contacts = Contact.all()
  new_number = PhoneNumber.new({:area_code => params.fetch('area_code'), :phone_number => params.fetch('phone_number'), :type => params.fetch('type')})
  new_number.save()
  @contact.add_phone_number(new_number)
  @number = PhoneNumber.all()
  erb(:contact)
end

get('/contacts/:id/email_addresses/new') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:email_form)
end

post('/contacts/:id/email_addresses/new') do
  @contact = Contact.find(params.fetch('id').to_i)
  @contacts = Contact.all()
  new_email = EmailAddress.new({:email_address => params.fetch('email_address'), :type => params.fetch('type')})
  new_email.save()
  @contact.add_email_address(new_email)
  @email = EmailAddress.all()
  erb(:contact)
end

get('/contacts/:id/mailing_addresses/new') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:mailing_form)
end

post('/contacts/:id/mailing_addresses/new') do
  @contact = Contact.find(params.fetch('id').to_i)
  @contacts = Contact.all()
  new_mailing = MailingAddress.new({:street_address => params.fetch('street_address'), :city => params.fetch('city'), :state => params.fetch('state'), :type => params.fetch('type')})
  new_mailing.save()
  @contact.add_mailing_address(new_mailing)
  @mailing = MailingAddress.all()
  erb(:contact)
end
