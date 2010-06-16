var window_width = 1200;
var window_height = 884;

jQuery(function($) {

  resizeSections();
  positionSections();

  // Transition between sections
  $('#menu a').click(function() {
    circleTheWagons($(this).attr('href'));
    return false;
  });
  
  // Open external links in new window and track in Google Analytics
  $('a').click(function() {
    var url = $(this).attr('href');
    if(!url.include(location.host)) {
      pageTracker._trackPageview('/external/' + url);
      window.open(url);
      return false;
    }
  });
  
});

function circleTheWagons(target_id) {
  var start = $('#main').position();
  var end = $(target_id).position();
  if(start.top > 0 && end.top) {
   if(start.left > end.left) {
     start_angle = 45;
     end_angle = -45;
   } else {
     start_angle = -45;
     end_angle = 45;
   }
  } else {
    if(start.left > end.left) {
     start_angle = 90;
     end_angle = -90;
   } else {
     start_angle = -90;
     end_angle = 90;
   }
  }
  
  //caluculateAngles(start_position, end_position);
  var path = new $.path.bezier({
    start: {
      x: start.left,
      y: start.top,
      angle: start_angle
    },
    end: {
      x: end.left * -1,
      y: end.top * -1,
      angle: end_angle
    }
  });
  $('#main').animate({path: path}, 3000, function() {
    window.location.replace(target_id);
  });
}

function calculateAngles(start, end) {
  /*
  if(start.top == end.top || start.left == end.left) {
    start_angle = 45;
    end_angle = -45;
  }
  */
  start_angle = 45;
  end_angle = -45;
}

function resizeSections() {
  window_width = $(window).width();
  window_height = $(window).height();
  $('.section').css('width', window_width);
  $('.section').css('height', window_height);
}

function positionSections() {
  $('#main').css('position', 'absolute');
  $('.section').css('position', 'absolute');
  $('#work').css('top', (window_height * -1) + 'px').css('left', (window_width * -1) + 'px');
  $('#about').css('top', (window_height * -1) + 'px').css('left', 0);
  $('#contact').css('top', 0).css('left', (window_width * -1) + 'px');
  $('#home').css('top', 0).css('left', 0);
}
