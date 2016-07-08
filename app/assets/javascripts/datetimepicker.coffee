class @DateTimePicker
  constructor: ->
    console.log 'exect'
    picker = $('.datetime')
    if picker
      picker.datetimepicker({
       format: 'DD/MM/YYYY HH:mm',
       icons:
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-arrow-up",
        down: "fa fa-arrow-down"
     })
     picker.on('focusout', (e) ->
       console.log 'changed'
       date = picker.data("DateTimePicker").date()
       if date
         console.log date
         picker.value = date.format('DD/MM/YYYY HH:mm') || ''
         console.log picker.val()
      )


# bound to turbolinks
$(document).on('turbolinks:load', -> DateTimePicker())
