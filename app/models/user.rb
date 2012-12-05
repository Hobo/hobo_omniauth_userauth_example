class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name          :string, :required
    email_address :email_address, :login => true, :validate => false
    administrator :boolean, :default => false
    image         :string
    timestamps
  end
  attr_accessible :name, :email_address, :image

  include HoboOmniauth::UserAuth

  # --- Permissions --- #

  def create_permitted?
    # Only the initial admin user can be created
    self.class.count == 0
  end

  def update_permitted?
    acting_user.administrator? ||
      (acting_user == self && only_changed?(:email_address, :crypted_password,
                                            :current_password, :password, :password_confirmation))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end
end
