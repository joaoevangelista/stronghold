$(document).on('turbolinks:load', ->
  textarea = $('#comment_content')
  if textarea && textarea.length
    textarea.focus()
  )
