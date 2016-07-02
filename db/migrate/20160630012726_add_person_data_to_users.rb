# frozen_string_literal: true
# :nodoc:
class AddPersonDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
  end
end
