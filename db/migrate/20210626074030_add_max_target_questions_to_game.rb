class AddMaxTargetQuestionsToGame < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :max_target_questions, :integer, default: 0
  end
end
