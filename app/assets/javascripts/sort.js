function addEventListenerToAlphaButton() {
  $(".alpha-sort").on("click", function() {
    var response = sortCall("alpha")
    console.log(response)
    //returning undefined.
  })
}

function sortCall(sortType) {
  $.ajax({
    url: "/api/v1/links/",
    method: "GET",
    dataType: "JSON",
    data: {
      sortType: sortType
    }
  });
}
