# frozen_string_literal: true
# User related helpers
module UserHelper
  # Render a gravatar url based on the user's email
  def gravatar(email, size = 50)
    hash = Digest::MD5::hexdigest email
    "https://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end
end
