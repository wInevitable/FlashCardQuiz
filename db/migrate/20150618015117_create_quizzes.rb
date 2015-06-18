class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      # You could track the number of attempts in the DB
      # But doing so on the Front End will speed up the App and reduce queries
      # t.integer :num_of_attempts, null: false, default: 0
      t.float   :score,   null: false, default: 0
      t.integer :set_id,  null: false

      t.timestamps        null: false
    end

    add_index :quizzes, :score
    add_index :quizzes, :set_id
  end
end
