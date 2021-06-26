class AddTargetPlayerIdToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :target_player_id, :integer
  end
end
