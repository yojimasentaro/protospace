$(document).on('ready page:load', function(){
  $('.js-preview-images').each(function() {
    var preview = $(this),
        image   = preview.find('input[type=file]');
    console.log('preview is:');
    console.log(preview);
    console.log('image is:');
    console.log(image);


    image.change(function(){
      console.log('image changed');
      console.log('this.files are:');
      console.log(this.files);
      if (!this.files.length) {
        return;
      }
      var file = this.files[0]
      console.log('file is:');
      console.log(file);
      fileReader = new FileReader();
      fileReader.readAsDataURL(file);
      fileReader.onload = function(){
        console.log('fileReader loaded and fileReader.result is');
        console.log(fileReader.result);
        preview.css({
          'background-image': 'url(' + fileReader.result + ')',
          'background-size' : 'cover'
        });
      };
    });
  });
});

