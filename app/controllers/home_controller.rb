# frozen_string_literal: true
# :nodoc:
class HomeController < ApplicationController
  def index
    @disable_nav = true
  end
end
