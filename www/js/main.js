// sticky footer
$(function(){
  h = $(".footer").height();
  positionFooter();
  function positionFooter(){
    if($(document).height() <= $(window).height()) {
      var x = $(window).height() - h - 142;
      $(".content").css("min-height", x + "px");
    };
  };
  $(window)
    .scroll(positionFooter)
    .resize(positionFooter)
});

// carousel
$(function(){
  $("#screenshots").carousel();
})

// fix anchor issues due to fix navbar
$(function(){
  scrollDown();
  function scrollDown() {
    $("a").each(function() {
      if ($(this).attr("name")) {
        $(this).css("position", "relative");
        $(this).css("top", "-80px");
        $(this).html("&nbsp;");
      }
    })  
  }
})

// active page
$(function(){
  $("li").each(function(){
          var href = $(this).children("a").attr("href");
          if (href) {
              if (window.location.pathname.substr(-href.length-1) == "/"+href) {
                  $(this).addClass("active");
              } else {
                  $(this).addClass("nochildren");
              }
          }
      });
  $(".nochildren").children("ul").hide();
})

// show images
$(function(){
  $(".thumbnails img").each(function(m,i){
          $(i).click(function(){window.open($(i).attr("src"))}); 
  })
})
