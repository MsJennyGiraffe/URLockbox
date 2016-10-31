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
  for (i = 0; i < response.length; i++) {
    appendLinkToPage(response[i])
  }
}

function appendLinkToPage(link) {
  $(".urls").append(createLinkHTML(link));
}

function createLinkHTML(link) {
  return link.title + link.url
}
