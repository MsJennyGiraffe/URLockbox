function addEventListenerToAlphaButton() {
  $(".alpha-sort").on("click", function() {
    var response = sortCall("alpha")
  })
}

function sortCall(sortType) {
  $.ajax({
    url: "/api/v1/links/",
    method: "GET",
    dataType: "JSON",
    data: {
      sortType: sortType
    },
    success: function(response) {
      renderResponse(response)
    }
  });
}

function renderResponse(response) {
  $(".urls").empty();
  for (i = 0; i < response.length; i++) {
    appendLinkToPage(response[i])
  }
}

function appendLinkToPage(link) {
  $(".urls").append(createLinkHTML(link));
}

function createLinkHTML(link) {
  return (
    "<div class='col-md-4'>" +
    "<br>" +
    "<div class='url-" +
    link.id +
    "'>" +
    "<h5> Title: " +
    link.title +
    "</h5>" +
    isRead(link) +
    "<h5>" +
    "<a href='links/" +
    link.id +
    "/edit' class='btn btn-info btn-block'>" +
    "Edit Link" +
    "</a>" +
    "</div>" +
    "</div>"
  )
}

function isRead (link) {
  if (link.read) {
    return (
      "<h5 class='link-" +
      link.id +
      "strike'>URL:" +
      link.url +
      "</h5>" +
      "<button id='" +
      link.id +
      "-read-button' class='unread-button btn btn-info btn-block'>Mark as Unread</button>"
    )
  }
  else {
     return (
       "<h5 class='link-" +
        link.id +
        "'>URL: " +
        link.url +
        "</h5>" +
        "<button id='" +
        link.id +
        "-read-button' class='read-button btn btn-info btn-block'>Mark as Read</button>"
     )
  }
}
