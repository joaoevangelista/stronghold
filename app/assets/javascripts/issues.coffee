$(document).on('turbolinks:load', ->
  textarea = $('#comment_content')
  if textarea && textarea.val() != ''
    textarea.focus()
  )
