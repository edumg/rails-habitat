var total_selected = 0;

$('#persona_img_1').click(function() {
  $(this).toggleClass("img-selected");
  updateTotalSelected($(this));
});

$('#persona_img_2').click(function() {
  $(this).toggleClass("img-selected");
  updateTotalSelected($(this));
});

$('#persona_img_3').click(function() {
  $(this).toggleClass("img-selected");
  updateTotalSelected($(this));
});

$('#persona_img_4').click(function() {
  $(this).toggleClass("img-selected");
  updateTotalSelected($(this));
});

$('#persona_img_5').click(function() {
  $(this).toggleClass("img-selected");
  updateTotalSelected($(this));
});

$('#persona_img_6').click(function() {
  $(this).toggleClass("img-selected");
  updateTotalSelected($(this));
});

function updateTotalSelected(elem){
  if(elem.hasClass("img-selected")) {
    total_selected++;
    if(total_selected == 3) {
      alert('Maximum option reached!');
    }
  } else {
    total_selected--;
  }

  if(total_selected > 0){
    $('#button-next').removeClass('hidden');
  } else {
    $('#button-next').addClass('hidden');
  }
}
