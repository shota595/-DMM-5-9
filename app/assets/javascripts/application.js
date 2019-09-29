// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require jquery
//= require cocoon
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(function() {
  $(document).on('click', 'input[type=submit]', function() {
    if ($('input[type=text]').val() == ' ') {
      return false;
    }
  })

  // $(document).on('ajax:success', 'form', function(e) {
  //   $('.newbook').val(' ');
  //   $('.book_wrapper').prepend('<td>' + <img class="attachment user profile_image fallback" src="/assets/no_image-c7305210e2d30bf8f19461ca05a151bba6413a44a35124f673246160efefdc5e.jpg" width="40" height="40"> + '</td>' + '<td>' + e.detail[0][0] + '</td>' + '<td>' + e.detail[0][1] + '</td>' + '<td>' + 'sss' + '</td>')
  //   console.log(e);
  // })

  // $(document).on('ajax:success', 'form', function(e) {
  //   $('.newbook').val(' ');
  //   $('.new-book').apend()
  // })
