class AddCategoryRatingToNews < ActiveRecord::Migration
  def change
    add_column :news, :category, :string
    add_column :news, :rating, :integer
  end
end
