// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//=require bootstrap-sprockets

document.addEventListener("DOMContentLoaded", function(event) {
  // Create
  $("#item-create-btn").on("click", function() {
    var userId = $("body").data("current-user");
    var name = $("#item_name").val();

    $.ajax({
      method: "POST",
      url: "users/" + userId + "/items",
      dataType: "text",
      data: { "item": { "name": name } }
    }).done(function(data) {
      $("#items-list").append(data);
    })
  });

  // Delete
  // $("#item-destroy-btn").on("click", function() {
  //   var id = $(this).attr(".data-id");
  //   console.log(id);
  //   // debugger;
  //   //
  //   // $.ajax({
  //   //
  //   //
  //   // }).done(function(data){
  //   //   $(".data-id").remove(data);
  //   // })


  });
