class AddUserIdToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :user_id, :integer
  end
end
