# frozen_string_literal: true
class CreateIssueTypes < ActiveRecord::Migration
  def change
    create_table :issue_types do |t|
      t.string :name
      t.string :color

      t.timestamps null: false
    end
  end
end
