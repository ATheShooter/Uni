class AddUniversityIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :university_id, :integer
  end
end
