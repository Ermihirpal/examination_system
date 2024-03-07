class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :ans
      t.references :question, foreign_key: :true  
      t.references :student ,foreign_key: :true 

      t.timestamps
    end
  end
end
