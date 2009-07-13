document.observe("dom:loaded", function() {
  track_external_link_clicks_and_open_in_new_window();
}

function track_external_link_clicks_and_open_in_new_window() {
  $$('a').each(function(link) {
    var url = link.readAttribute('href');
    if(!url.include(location.host)) {
      link.writeAttribute('target', '_blank');
      link.observe('click', record_external_link_click);
    }
  });
}

function record_external_link_click(event) {
  var url = event.element().readAttribute('href').sub(/^https?\:\/\//i, '');
  pageTracker._trackPageview('/external/' + url);
}
