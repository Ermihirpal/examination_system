class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end
