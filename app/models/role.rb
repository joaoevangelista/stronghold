# frozen_string_literal: true
# Role that a user has
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true
            # optional: true Only Rails 5 supports

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
