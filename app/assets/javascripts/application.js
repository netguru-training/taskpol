//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require jquery-ui

var onReady = function() {
  $(".js-suggest-button").on("click", function(event) {
    event.preventDefault();
    $.get("http://api.githunt.io/programmingexcuses").then(function(data){
      $("#comment_desc").text(data);
    });
    return true;
  }).prop('disabled', false);

  $(".connectedSortable").sortable({
    connectWith: ".connectedSortable",
    update: function(event, ui ) {
        var columns = $(".js-status");
    }
  }).disableSelection();
};

$( document ).ready(onReady);
$( document ).on('page:load', onReady);
