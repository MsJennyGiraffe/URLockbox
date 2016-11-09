function addEventListenerToReadButton() {
  $(".urls").on("click", ".read-button", function(event) {
    var id = event.target.id.split("-")[0]
    event.target.innerHTML = "Mark as Unread"
    event.target.className = "unread-button btn btn-info btn-block"
    changeReadStatusForUrl(id, "read");
    changeURL(id);
  })
}

function addEventListenerToUnreadButton() {
  $(".urls").on("click", ".unread-button", function(event) {
    var id = event.target.id.split("-")[0]
    event.target.innerHTML = "Mark as Read"
    event.target.className = "read-button btn btn-info btn-block"
    changeReadStatusForUrl(id, "unread");
    changeURL(id);
  })
}

function changeURL(id) {
  $(".link-" + id).toggleClass("strike")
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
