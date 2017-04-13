var total_selected_q1 = 0;
var total_selected_q2 = 0;
var total_selected_q3 = 0;
var target = 3;

// question 1
$('#persona_img_1_q1').click(function() {
  updateTotalSelected_q1($(this));
});

$('#persona_img_2_q1').click(function() {
  updateTotalSelected_q1($(this));
});

$('#persona_img_3_q1').click(function() {
  updateTotalSelected_q1($(this));
});

$('#persona_img_4_q1').click(function() {
  updateTotalSelected_q1($(this));
});

$('#persona_img_5_q1').click(function() {
  updateTotalSelected_q1($(this));
});

$('#persona_img_6_q1').click(function() {
  updateTotalSelected_q1($(this));
});

function updateTotalSelected_q1(elem){
  if(total_selected_q1 < target) {
    elem.toggleClass("img-selected");
    if(elem.hasClass("img-selected")) {
      total_selected_q1++;
    } else {
      total_selected_q1--;
    }
  } else {
    if(elem.hasClass("img-selected")) {
      elem.removeClass("img-selected");
      total_selected_q1--;
    } else {
      alert('Maximum option reached!');
    }
  }

  if(total_selected_q1 > 0){
    $('#button-next').removeClass('hidden');
  } else {
    $('#button-next').addClass('hidden');
  }

  checkQuestionInFocus_q1();
}

function checkQuestionInFocus_q1() {
  if($('#persona_img_1_q1').hasClass("img-selected")
    || $('#persona_img_2_q1').hasClass("img-selected")
    || $('#persona_img_3_q1').hasClass("img-selected")
    || $('#persona_img_4_q1').hasClass("img-selected")
    || $('#persona_img_5_q1').hasClass("img-selected")
    || $('#persona_img_6_q1').hasClass("img-selected")) {

    $('#persona-question-id-1').addClass('selected-question');
  } else {
    $('#persona-question-id-1').removeClass('selected-question');
  }
}


$('#button-next').click(function() {
  if($('#persona-question-id-1').hasClass('selected-question')) {
    $('#img-question-1').addClass('hidden');
    $('#img-question-2').removeClass('hidden');
    $('#img-question-3').addClass('hidden');
  }

  if($('#persona-question-id-2').hasClass('selected-question')) {
    $('#img-question-2').addClass('hidden');
    $('#img-question-1').addClass('hidden');
    $('#img-question-3').removeClass('hidden');
  }
});

// question 2
$('#persona_img_1_q2').click(function() {
  updateTotalSelected_q2($(this));
});

$('#persona_img_2_q2').click(function() {
  updateTotalSelected_q2($(this));
});

$('#persona_img_3_q2').click(function() {
  updateTotalSelected_q2($(this));
});

$('#persona_img_4_q2').click(function() {
  updateTotalSelected_q2($(this));
});

$('#persona_img_5_q2').click(function() {
  updateTotalSelected_q2($(this));
});

$('#persona_img_6_q2').click(function() {
  updateTotalSelected_q2($(this));
});

function updateTotalSelected_q2(elem){
  if(total_selected_q2 < target) {
    elem.toggleClass("img-selected");
    if(elem.hasClass("img-selected")) {
      total_selected_q2++;
    } else {
      total_selected_q2--;
    }
  } else {
    if(elem.hasClass("img-selected")) {
      elem.removeClass("img-selected");
      total_selected_q2--;
    } else {
      alert('Maximum option reached!');
    }
  }

  if(total_selected_q2 > 0){
    $('#button-next').removeClass('hidden');
  } else {
    $('#button-next').addClass('hidden');
  }

  checkQuestionInFocus_q2();
}

function checkQuestionInFocus_q2() {
  if($('#persona_img_1_q2').hasClass("img-selected")
    || $('#persona_img_2_q2').hasClass("img-selected")
    || $('#persona_img_3_q2').hasClass("img-selected")
    || $('#persona_img_4_q2').hasClass("img-selected")
    || $('#persona_img_5_q2').hasClass("img-selected")
    || $('#persona_img_6_q2').hasClass("img-selected")) {

    $('#persona-question-id-2').addClass('selected-question');
  } else {
    $('#persona-question-id-2').removeClass('selected-question');
  }
}

// question 3
$('#persona_img_1_q3').click(function() {
  updateTotalSelected_q3($(this));
});

$('#persona_img_2_q3').click(function() {
  updateTotalSelected_q3($(this));
});

$('#persona_img_3_q3').click(function() {
  updateTotalSelected_q3($(this));
});

$('#persona_img_4_q3').click(function() {
  updateTotalSelected_q3($(this));
});

$('#persona_img_5_q3').click(function() {
  updateTotalSelected_q3($(this));
});

$('#persona_img_6_q3').click(function() {
  updateTotalSelected_q3($(this));
});

function updateTotalSelected_q3(elem){
  if(total_selected_q3 < target) {
    elem.toggleClass("img-selected");
    if(elem.hasClass("img-selected")) {
      total_selected_q3++;
    } else {
      total_selected_q3--;
    }
  } else {
    if(elem.hasClass("img-selected")) {
      elem.removeClass("img-selected");
      total_selected_q3--;
    } else {
      alert('Maximum option reached!');
    }
  }

  if(total_selected_q3 > 0){
    $('#button-done').removeClass('hidden');
    $('#button-next').addClass('hidden');
  } else {
    $('#button-done').addClass('hidden');
    $('#button-next').addClass('hidden');
  }

  checkQuestionInFocus_q3();
}

function checkQuestionInFocus_q3() {
  if($('#persona_img_1_q3').hasClass("img-selected")
    || $('#persona_img_2_q3').hasClass("img-selected")
    || $('#persona_img_3_q3').hasClass("img-selected")
    || $('#persona_img_4_q3').hasClass("img-selected")
    || $('#persona_img_5_q3').hasClass("img-selected")
    || $('#persona_img_6_q3').hasClass("img-selected")) {

    $('#persona-question-id-3').addClass('selected-question');
  } else {
    $('#persona-question-id-3').removeClass('selected-question');
  }
}

$('#button-done').click(function() {
  var elements = document.getElementsByClassName("img-selected");
  var names = '';

  for(var i=0; i<elements.length; i++) {
      // console.log(elements[i].src);
      names += elements[i].src + ",";
  }
  document.location.href = '/personality/done?results=' + names;

  // document.cookie="something= " + names;
});
