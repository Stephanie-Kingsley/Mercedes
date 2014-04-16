var witnesses = [".MS", ".A1", ".B1",".F1", ".K", ".P1", ".P2"];
var default_val = ".K";

$(document).ready(function() {

  $('.rdg').popover({
    html: true
  });
$('.rdg').click(function(){

  console.log($(this));
});


  //console.log('witnesses', witnesses.join(','));

  $('.K,.MS,.A1,.B1,.F1,.P1,.P2').hide();
  $(default_val).show();

  $('.nav li a').click(function() {
    var element = '.' + $(this).data('witness');

   $('.K,.MS,.A1,.B1,.F1,.P1,.P2').hide(); 

    $(element).show();


    //console.log(element);
  });
});

var fixNav = function() {
     var navBar = $('.navbar-collapse');

     if ($(window).scrollTop() > (navBar.height() - 10)) {
         navBar.addClass('fixed');
     }
     else {
         navBar.removeClass('fixed');
     }
};

$(window).bind('scroll', function() {
    fixNav();
});

fixNav();

