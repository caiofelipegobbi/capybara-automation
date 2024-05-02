require 'spec_helper'
require "#{__dir__}/../page_objects/login_page"

describe "Login Tests", type: :feature do
  before :each do
    @login_page = LoginPage.new
  end

    
  it "TC001: Positive Login" do
    @login_page.login('demouser', 'abc123')
    expect(page).to have_current_path('/account') # Not using the whole URL assuming the test runs on different environments.
    expect(page).to have_css('h2', text: 'Invoice List')
  end

  data_table = [
    { username: 'Demouser', password: 'abc123'},
    { username: 'demouser_', password: 'xyz'},
    { username: 'demouser', password: 'nananana'},
    { username: 'demouser', password: 'abc123'}
  ]
  
  data_table.each_with_index do |data, index|
    it "TC002: Negative Login #{index + 1}" do
      @login_page.login(data[:username], data[:password])
      expect(page).to have_content('Wrong username or password.')
    end
  end

end