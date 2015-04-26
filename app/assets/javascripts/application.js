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
        var statuses = $(".js-status");
        var tasks = $(".js-task");

        var index_status = $.map(statuses, function(item, idx) {
          //debugger
          var status = $(item).data("id");
          var task_ids = $(item).find(".js-task").map(function(idx, item) {
            return $(item).data("id");
          });
          return {status_id: status, task_ids: task_ids }
        });

        $.post("update_tasks", JSON.stringify(index_status), "json");
    }
  }).disableSelection();
};

$( document ).ready(onReady);
$( document ).on('page:load', onReady);
