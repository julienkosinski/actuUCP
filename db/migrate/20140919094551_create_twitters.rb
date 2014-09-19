class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :searchElements

      t.timestamps
    end
  end
end
