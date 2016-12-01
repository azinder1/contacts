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

get('/contacts/new') do
  erb(:contacts_form)
end

post('/contacts') do
  new_contact = Contact.new({:first_name => params.fetch('first_name'), :last_name => params.fetch('last_name'), :company => params.fetch('company'), :job_title => params.fetch('job_title')})
  new_contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i)
  erb(:contact)
end
