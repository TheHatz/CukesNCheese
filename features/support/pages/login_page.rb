class LoginPage
  include PageObject

  text_field(:username, :id => 'name')
  text_field(:password, :id => 'password')

  button(:login, :value => 'Login')

  def log_in(username = 'username', password = 'password')
    self.username = username
    self.password = password
    login

  end


end