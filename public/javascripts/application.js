$().ready(function() {
  var newYear = new Date(2010, 6, 17, 14, 0, 0); 
  newYear = new Date(newYear); 
  $('#defaultCountdown').countdown({until: newYear, layout: '{dn} {dl}, {hn} {hl}, {mn} {ml} and {sn} {sl}'});
});