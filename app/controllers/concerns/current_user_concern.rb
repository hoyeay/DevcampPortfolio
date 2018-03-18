module CurrentUserConcern
  extend ActiveSupport::Concern

  # If super is true, call its parent method or if guest_user true, call that method
  def current_user
    super || guest_user

  end
  
  def guest_user
    OpenStruct.new(name: 'Guest User', 
                   first_name: 'Guest', 
                   last_name: 'User', 
                   email: 'guest@test.com')
  end
  
end