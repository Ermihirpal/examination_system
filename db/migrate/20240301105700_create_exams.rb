class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :subject
      t.integer :total_marks
      t.integer :per_que_mark
      t.integer :time_duration
      t.timestamps
    end
  end
end
