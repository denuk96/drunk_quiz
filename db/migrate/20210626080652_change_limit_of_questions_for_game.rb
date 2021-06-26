class ChangeLimitOfQuestionsForGame < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :max_questions, :integer, default: 3
  end
end
