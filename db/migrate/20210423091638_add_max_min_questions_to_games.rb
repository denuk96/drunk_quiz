class AddMaxMinQuestionsToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :min_questions, :integer, default: 0
    add_column :games, :max_questions, :integer, default: 999
  end
end
