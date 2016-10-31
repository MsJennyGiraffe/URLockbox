$( document ).ready(function() {
  addEventListenerToReadButton();
  addEventListenerToUnreadButton();
});

function addEventListenerToReadButton() {
  $(".read-button").on("click", function() {
    var id = event.target.id.split("-")[0]
    changeReadStatusForUrl(id, "read");
  })
}

function addEventListenerToUnreadButton() {
  $(".unread-button").on("click", function() {
    var id = event.target.id.split("-")[0]
    changeReadStatusForUrl(id, "unread");
  })
}

function changeReadStatusForUrl(id, status) {
  $.ajax({
    url: "/api/v1/links/" + id,
    method: "PATCH",
    dataType: "JSON",
    data: {
      update: status
    }
  });
}
