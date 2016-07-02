# frozen_string_literal: true
# :nodoc:
module IssueTypesHelper
  # Render a span label for the given severity
  def type_label(type)
    text_color = text_color_for_bg(type.color)
    "<span class='label' style='background: #{type.color} ; color: #{text_color}'>
    #{type.name}</span>".html_safe
  end

  # Find a sutiable color based on the background color
  def text_color_for_bg(bg_color)
    if bg_color.length == 4
      r, g, b = bg_color[1, 4].scan(/./).map { |v| (v * 2).hex }
    else
      r, g, b = bg_color[1, 7].scan(/.{2}/).map(&:hex)
    end

    if r && g && b
      decide_color r, g, b
    else
      '#FFFFFF'
    end
  end
end

def decide_color(r, g, b)
  if (r + g + b) > 500
    '#333333'
  else
    '#FFFFFF'
  end
end
