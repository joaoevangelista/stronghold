# frozen_string_literal: true
# Initial migration for read model
class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.references :user, index: true, foreign_key: true
      t.references :announcement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
