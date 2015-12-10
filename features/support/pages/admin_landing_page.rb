require_relative 'side_menu_panel'

class AdminLandingPage
  include PageObject
  include SideMenuPanel

  #page_url("http://puppies.herokuapp.com/admin")
  page_url("http://localhost:3000/admin")


end