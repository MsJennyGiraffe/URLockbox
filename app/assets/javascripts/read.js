function addEventListenerToReadSort() {
  $(".read-sort").on("click", function(event) {
    getSortLinks("read");
  })
}

function addEventListenerToUnreadSort() {
  $(".unread-sort").on("click", function(event) {
    getSortLinks("unread");
  })
}

function getSortLinks(status) {
  $.ajax({
    url: "/api/v1/links",
    method: "GET",
    dataType: "JSON",
    data: {
      sortType: status
    },
    success: function(response) {
      renderResponse(response)
    }
  });
}
