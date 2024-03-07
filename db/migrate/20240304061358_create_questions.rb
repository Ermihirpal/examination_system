class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :que
      t.belongs_to :exam
      t.timestamps
    end
  end
end
