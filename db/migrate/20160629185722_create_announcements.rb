# frozen_string_literal: true
# :nodoc:
class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.boolean :notify

      t.timestamps null: false
    end
  end
end
