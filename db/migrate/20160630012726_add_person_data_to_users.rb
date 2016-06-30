# frozen_string_literal: true
class AddPersonDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
  end
end
