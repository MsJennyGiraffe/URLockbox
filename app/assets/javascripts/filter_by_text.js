var responseArray = [];

function addEventListenerToTextField() {
  $("#text-field").on("keydown", function(event) {
    responseArray.push(event.key);
    searchUrls();
  })
}

// function searchUrls() {
//   // if class contains link or if class is title
//   var titleClass = $(".title");
//   var titleArray = []
//   for (i = 0; i < titleClass.length; i++) {
//     titleArray.push(titleClass[i].innerHTML.split("Title: ")[1])
//   }
//
//   titleArray.forEach(function(title) {
//     if (title.match(responseArray.join(""))) {
//
//
//     }
//   })
//
// }

function searchUrls() {
  searchTerm = responseArray.join("")
  var links = $(".url");
  for (i = 0; i < links.length; i++) {
  var url = $(links[i]).context
    // .match(searchTerm)
    console.log(links[i])
  }
}
