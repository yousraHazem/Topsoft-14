$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/chat/new', function (data) {
    eval(data);
  });
});
