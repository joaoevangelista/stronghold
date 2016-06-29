# frozen_string_literal: true
module ApplicationHelper
  def gravatar(email, size = 50)
    hash = Digest::MD5::hexdigest email
    "http://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end
end
