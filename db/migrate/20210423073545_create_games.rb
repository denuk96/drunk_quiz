class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :slug

      t.timestamps
    end
    add_index :games, :slug
  end
end
