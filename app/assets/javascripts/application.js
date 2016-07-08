//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require twitter/bootstrap/rails/confirm
//= require bootstrap-datepicker
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

// Close the notice autommatic
$('#notice').ready(function () {
  $('#notice').fadeTo(2000,1000).slideUp(1000, function () {
    $('#notice').alert('close');
  });
});
