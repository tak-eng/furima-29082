document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');

  document.getElementById('image-list').addEventListener('change', function(e){
    const file = e.target.files[0];
  });
});