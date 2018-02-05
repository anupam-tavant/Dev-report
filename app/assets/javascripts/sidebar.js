$(document).ready(function() {
  $(".sidebar-nav ul.nav li").click(function(){
    $(this).toggleClass('active');
    $(this).find('ul').slideToggle();
  });
});