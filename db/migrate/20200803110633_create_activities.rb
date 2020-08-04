class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :content
      t.string :category
      t.datetime :start_day
      t.datetime :end_day
      t.string :slug

      t.timestamps
    end
    add_index :activities, :slug, unique: true
  end
end
