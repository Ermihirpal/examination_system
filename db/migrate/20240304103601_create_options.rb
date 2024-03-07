class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :option_val
      t.boolean :is_correct , default: :false
      t.belongs_to :question
      t.timestamps
    end
  end
end
