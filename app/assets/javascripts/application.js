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
//= require bootstrap-sprockets
//= require rails-ujs
//= require_tree .

// Resizes images to fit properly on the gardens#index page.
function resizeGardenPhotos (container, images) {
  var maxWidth = $(container).width();
  var images = $(images);

  images.each(function () {
    var photo = $(this)
    var height = photo.height();
    var width = photo.width();
    var calculated_width = 300*width/height;

    if(maxWidth < calculated_width) {
      photo.addClass('auto-height-photo');
      photo.removeClass('auto-width-photo');
    } else {
      photo.addClass('auto-width-photo');
      photo.removeClass('auto-height-photo');
    }
  });
}

// Displays and auto resizes a preview image on the garden_reports#new page.
function displayPreviewImage(input, container, images) {

  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      var photo = $(".preview-image");

      if(0 == photo.length) {
        $('#preview-image-container').append($('<img>',{class: 'preview-image', src: e.target.result}));
        resizeGardenPhotos(container, images);
        $(window).resize(resizeGardenPhotos.bind(this, container, images));
      } else {
        photo.first().attr('src', e.target.result);
      }
    }

    reader.readAsDataURL(input.files[0]);
  }
}
