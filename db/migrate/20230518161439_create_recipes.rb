class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :complexity
      t.string :genre

      t.timestamps
    end
  end
end
