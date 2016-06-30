# frozen_string_literal: true
# Controller that wraps common authenticated
# logic to be applied to all controllers
#
# You can use ApplicationController if you don't want to have before action
# on those default methods
#
class AuthenticatedController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :show,
                                            :index, :destroy]
end
