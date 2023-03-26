class AddNameAndCommentsToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :name, :string
    add_column :ratings, :comments, :text
  end
end
