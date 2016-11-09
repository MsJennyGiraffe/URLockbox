function addEventListenerToTextField() {
  $("#text-field").on("keydown", function(event) {
    getUrls();
  })
}

function getUrls() {
  $.ajax({
    url: "/api/v1/links",
    method: "GET",
    dataType: "JSON",
    success: function(response) {
      sortUrls(response);
    }
  });
}

function sortUrls(response) {
  var filteredArray = [];
  var userInput = $("#text-field").val();
  response.forEach(function(urlObject) {
    if (urlObject.title.includes(userInput) || urlObject.url.includes(userInput)) {
      filteredArray.push(urlObject)
    }
  })
  renderResponse(filteredArray)
}
