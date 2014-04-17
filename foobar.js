var witnesses = [".MS", ".A1", ".B1",".F1", ".K", ".P1", ".P2"];
var default_val = ".K";

$(document).ready(function() {

  $('.rdg').popover({
    html: true
  });
$('.rdg').click(function(){

  console.log($(this));
});



$('#app-toggle-off').click(function(){
  console.log($(this));
  $('.rev, .punc,.cap,.comp_err,.auth_err,.pub,.orth').css('color', 'black');
});
$('#app-toggle-on').click(function(){
  console.log($(this));
  $('.rev').css('color', '#990099');
  $('.punc').css('color', 'blue');
  $('.cap').css('color', 'aqua');
  $('.comp_err').css('color', 'orange');
  $('.auth_err').css('color', 'olive');
  $('.pub').css('color', 'fuchsia');
  $('.orth').css('color',"#CC3300");
});


  //console.log('witnesses', witnesses.join(','));

  $('.K,.MS,.A1,.B1,.F1,.P1,.P2').hide();
  $(default_val).show();

  $('.nav li a').click(function() {
    var element = '.' + $(this).data('witness');

   $('.K,.MS,.A1,.B1,.F1,.P1,.P2').hide(); 

    $(element).show();
//Look up the jquery CSS method.

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

