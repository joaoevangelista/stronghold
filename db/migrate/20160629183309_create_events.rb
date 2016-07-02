# frozen_string_literal: true
# :nodoc:
class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.datetime :time

      t.timestamps null: false
    end
  end
end
