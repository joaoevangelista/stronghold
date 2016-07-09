$(document).on('turbolinks:load', ->
  textarea = $('#comment_content')
  if textarea && textarea.val().length
    textarea.focus()
  )
