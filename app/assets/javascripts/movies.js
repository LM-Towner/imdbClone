// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready ->

  $("#new-review").on("ajax:success", (e, data, status, xhr) ->
    $("#new-review").append xhr.responseText
  ).on ("ajax:error", (e, xhr, status, error) ->
    $("#new-review").append "<p>ERROR</p>"
