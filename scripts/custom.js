$(document).ready(function () {

  $.backstretch("./design/layout/bg1.jpg");

  Shadowbox.init();
  
  Shadowbox.setup("ul.gallery a", {
    gallery:        "gallery",
    continuous:     true,
    counterType:    "skip"
  });

});
 

