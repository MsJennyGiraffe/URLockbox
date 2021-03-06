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
    "<h4>" +
    checkSiteName(link) +
    "</h4>" +
    "<h4>" +
    checkSiteHeader(link) +
    "</h4>" +
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
      " strike'>URL:" +
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

function checkSiteName(link) {
  if (!(link.site_name === null)) {
    return link.site_name;
  }
  else {
    return " ";
  }
}

function checkSiteHeader(link) {
  if (!(link.h1 === null)) {
    return link.h1;
  }
  else {
    return " ";
  }
}
