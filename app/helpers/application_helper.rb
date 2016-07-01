# frozen_string_literal: true
module ApplicationHelper
  def gravatar(email, size = 50)
    hash = Digest::MD5::hexdigest email
    "http://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end

  def date_time(str)
    return '' if not str
    str.strftime('%b %d, %Y - %H:%M')
  end

  def date(str)
    return '' if not str
    str.strftime('%b %d, %Y')
  end
end
