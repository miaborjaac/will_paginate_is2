class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.integer :age
      t.string :career
      t.decimal :PAPA

      t.timestamps
    end
  end
end
