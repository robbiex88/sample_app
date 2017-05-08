class AddIndexToEmailForUserModel < ActiveRecord::Migration[5.0]
  def change
  	add_index :users, :email, unique: true
  	# add_index <table_name>, :field, options: {}
  end
end
