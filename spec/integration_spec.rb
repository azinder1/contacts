require('contact')
require('email_address')
require('mailing_address')
require('phone_info')
require('./app')
require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('creates a contact object with user inputted properties') do
    visit('/')
    expect(page).to have_content("Add a new contact")
  end
  it('creates a contact object with user inputted properties') do
    visit('/')
    click_link('Add a new contact')
    expect(page).to have_content("First Name:")
  end
  it('creates a contact object with user inputted properties') do
    visit('/')
    click_link('Add a new contact')
    fill_in('first_name', :with => 'Greatest')
    fill_in('last_name', :with => 'Ever')
    fill_in('company', :with => 'Skynet')
    fill_in('job_title', :with => 'Terminator')
    click_button('Submit')
    expect(page).to have_content("Greatest")
  end
end
