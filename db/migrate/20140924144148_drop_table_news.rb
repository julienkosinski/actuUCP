class DropTableNews < ActiveRecord::Migration
  def change
  	drop_table :news
  end
end
