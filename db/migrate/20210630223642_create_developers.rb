class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :infomation
      t.string :level

      t.timestamps
    end
  end
end
