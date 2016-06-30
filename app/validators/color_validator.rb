# Validates the pattern of a color declaration
# be it a hex, rgb or hsl
class ColorValidator < ActiveModel::EachValidator
  PATTERN = /\A\#[0-9A-Fa-f]{3}{1,2}+\Z/

  def validate_each(record, attribute, value)
    return true if value =~ PATTERN # <- guard clause
    record.errors.add(attribute, 'must be a valid color code')
  end

end
