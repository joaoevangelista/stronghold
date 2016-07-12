# frozen_string_literal: true
# Date related helpers such as parsers
module DateHelper
  def date_time(str)
    return '' unless str
    str.strftime('%b %d, %Y - %H:%M')
  end

  def date(str)
    return '' unless str
    str.strftime('%b %d, %Y')
  end
end
