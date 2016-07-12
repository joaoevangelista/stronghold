# frozen_string_literal: true
# :nodoc:
module ApplicationHelper
  def delete_link(text, path, options = {})
    link_to text, path,
            method: :delete,
            data: {
              confirm: 'This can\'t be undone',
              confirm_title: 'Are you sure ?',
              confirm_fade: true,
              confirm_cancel: 'No, keep all as is',
              confirm_proceed: 'Yes, I understand'
            },
            class: options[:class]
  end

  def go_back_link(path, _options = {})
    link_to icon('chevron-left', I18n.t('links.back'), class: 'fa-fw'), path,
            class: ['btn', 'btn-sm', 'btn-default']
  end
end
