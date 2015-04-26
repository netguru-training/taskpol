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
        var payload = {};

        var index_status = statuses.map(function(idx, item) {
          var status = $(item).data("id");
          var ids = [];
          var task_ids = $(item).find(".js-task").map(function(idx, item) {
            var id = $(item).data("id");
            ids.push(id);
            return id;
          });
          payload[status] = ids;
          return {status_id: status, task_ids: task_ids }
        });
        var url = $('.js-tasks').data('url');
        $.post(url, JSON.stringify(payload), "json");
    }
  }).disableSelection();
};

$( document ).ready(onReady);
$( document ).on('page:load', onReady);
