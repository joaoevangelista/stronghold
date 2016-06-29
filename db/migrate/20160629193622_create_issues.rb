# frozen_string_literal: true
class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.boolean :is_resolved
      t.references :user, index: true, foreign_key: true
      t.date :due_date
      t.integer :assignee_id
      t.references :issue_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
