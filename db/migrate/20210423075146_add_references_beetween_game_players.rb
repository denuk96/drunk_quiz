class AddReferencesBeetweenGamePlayers < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :player, index: true
  end
end
