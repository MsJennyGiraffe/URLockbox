$( document ).ready(function() {
  addEventListenerToReadButton();
  addEventListenerToUnreadButton();
});

function addEventListenerToReadButton() {
  $(".urls").on("click", ".read-button", function() {
    var id = event.target.id.split("-")[0]
    event.target.innerHTML = "Mark as Unread"
    event.target.className = "unread-button"
    changeReadStatusForUrl(id, "read");
    changeURL(id);
  })
}

function addEventListenerToUnreadButton() {
  $(".urls").on("click", ".unread-button", function() {
    var id = event.target.id.split("-")[0]
    event.target.innerHTML = "Mark as Read"
    event.target.className = "read-button"
    changeReadStatusForUrl(id, "unread");
    changeURL(id);
  })
}

function changeURL(id) {
  console.log($(".link-" + id).toggleClass("strike"))
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
