$( document ).ready(function() {
  addEventListenerToReadButton();
  addEventListenerToUnreadButton();
});

function addEventListenerToReadButton() {
  $(".read-button").on("click", function() {
    var id = event.target.id.split("-")[0]
    console.log(event.target.innerHTML)
    event.target.innerHTML = "Mark as Unread"
    event.target.className = "unread-button"
    changeReadStatusForUrl(id, "read");
  })
}

function addEventListenerToUnreadButton() {
  $(".unread-button").on("click", function() {
    var id = event.target.id.split("-")[0]
    event.target.innerHTML = "Mark as Read"
    event.target.className = "read-button"
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
