class AddSuperadmin < ActiveRecord::Migration[5.2]
  def change
    User.create! do |u|
      u.email     = 'admin@hotmail.com'
      u.password  = 'password'
      u.superadmin_role = true
    end
  end
end
