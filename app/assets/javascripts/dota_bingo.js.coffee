# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('form').submit (event) ->
    event.preventDefault()
    form = $(event.target).closest('form')
    console.dir form
    $("input[type='submit']",form).removeClass("not_selected").addClass("selected");
