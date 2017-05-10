<?php foreach ($images as $gimage) { ?>
<div class="gallery-photo col-sm-4">
  <a href="<?php echo $gimage['image']; ?>" data-fancybox="Галерея" data-caption="Фотогалерея"> 
    <img src="<?php echo $gimage['thumb']; ?>" class='img-responsive'>
  </a>
</div>
<?php } ?>