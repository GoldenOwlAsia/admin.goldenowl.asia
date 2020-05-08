class CreateCareerForms < ActiveRecord::Migration[6.0]
  def change
    create_table :career_forms do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :portfolio, null: false
      t.string :feedback, null: false

      t.timestamps
    end
  end
end
