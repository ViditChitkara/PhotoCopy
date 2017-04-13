class AddAccessTokenToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins , :access_token , :string 
  end
end
