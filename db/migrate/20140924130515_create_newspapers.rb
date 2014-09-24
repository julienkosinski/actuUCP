class CreateNewspapers < ActiveRecord::Migration
  def change
    create_table :newspapers do |t|
      t.string :title
      t.text :description
      t.string :rating
      t.string :author
      t.integer :id_category
      
      t.timestamps
    end
  end
end
