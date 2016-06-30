# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @disable_nav = true
  end
end
