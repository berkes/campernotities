// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require_tree .
//= require foundation

(function($) {
  $.fn.collapse = function() {
    this.toggleClass("collapsed")
    if (this.parent().children().length == 2) {
      this.parent().find("div").toggle();
    }
    else {
      this.parent().wrapInner("<div>");
      this.appendTo(this.parent().parent());
      this.parent().find("div").toggle();
    }
  }
}(jQuery));

urlParam = function(name) {
  var results = new RegExp('[?&]' + name + '=([^&#]*)').exec(window.location.href);
  if (!results) {
    return null;
  }
  return results[1] || null;
}

$(document).ready(function() {
  $("fieldset.collapsible legend").click(function(){$(this).collapse()});
  $("fieldset.collapsible.collapsed legend").collapse();
});
