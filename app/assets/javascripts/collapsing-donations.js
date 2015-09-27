var ready;
ready = function() {

  $(document).ready(function(){
    $(".donation-time").hide();
    $(".donation-candidate").on("click", function(event){
      $(this).siblings().first().toggle();
      $("span", this).toggleClass("glyphicon-chevron-right glyphicon-chevron-down");
    });
  });
};

$(document).ready(ready);
$(document).on("page:load", ready);
