// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  $(".reviews-container").on("submit", "#new-review", function(e){
    debugger;
    e.preventDefault();
    $.ajax({
      url: $(this).attr("action"),
      method: $(this).attr("method"),
      data: $(this).serialize(),
    }).done(function(response){
      console.log(response);
      debugger;
    })

  })


})
