class @DatePicker
  constructor: ->
    console.log 'executed'
    dp = $('#issue_due_date');
    if dp
      dp.datepicker({
        format: "dd/mm/yyyy"
      })
      .on('changeDate', (e) ->
        date = e.format(0, 'dd/mm/yyyy')
        dp.val(e.format(0, 'dd/mm/yyyy'))
      )
# bound to turbolinks
$(document).on('page:load', (e)->
  DatePicker()
)
# bound to page load manually
$(document).ready(-> DatePicker())
