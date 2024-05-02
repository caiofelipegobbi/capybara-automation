class LoginPage
  include Capybara::DSL

  def login_button
    find('#btnLogin')
  end

  def username_field
    find_field('username')
  end

  def password_field
    find_field('password')
  end

  def login(user, pass)
    visit '/'
    self.username_field.fill_in with: user
    self.password_field.fill_in with: pass
    self.login_button.click
  end
  
end