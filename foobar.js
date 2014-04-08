var witnesses = [".MS", ".A1", ".B1",".F1", ".K", ".P1", ".P2"];
var default_val = ".K";

$(document).ready(function() {

  $('.rdg').popover();

  //console.log('witnesses', witnesses.join(','));

  $('.MS,.A1,.B1,.F1,.P1,.P2').hide();
  $(default_val).show();

  $('.nav li a').click(function() {
    var element = '.' + $(this).data('witness');

   $('.MS,.A1,.B1,.F1').hide(); 

    $(element).show();

    //console.log(element);
  });
});
