# frozen_string_literal: true
# :nodoc:
module AnnouncementsHelper
  def short(description)
    return '' if description.blank?
    description[0...140]
  end
end
