class ChangeIdCategoryToNewspapers < ActiveRecord::Migration
  def change
  		rename_column :newspapers, :id_category, :id_categories
  end
end
