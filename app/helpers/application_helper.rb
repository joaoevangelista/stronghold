# frozen_string_literal: true
module ApplicationHelper
  def gravatar(email, size = 50)
    hash = Digest::MD5::hexdigest email
    "http://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end

  def date_time(str)
    return '' unless str
    str.strftime('%b %d, %Y - %H:%M')
  end

  def date(str)
    return '' unless str
    str.strftime('%b %d, %Y')
  end
end
