# frozen_string_literal: true

class RemoveCollumContentPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :content
  end
end
