class AddAdminUserIdToCamping < ActiveRecord::Migration
  def change
    add_column :campings, :admin_user_id, :integer
  end
end
