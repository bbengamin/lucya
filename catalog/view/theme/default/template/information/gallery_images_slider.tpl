<div class='owl-gallery owl-gallery-no-slides'>
  <?php foreach ($images as $gimage) { ?>
  <div class="item">
    <a href="<?php echo $gimage['image']; ?>" data-fancybox="Галерея" data-caption="Фотогалерея"> 
      <img src="<?php echo $gimage['thumb']; ?>" class='img-responsive'>
    </a>
  </div>
  <?php } ?>
</div>
<!--<script>

</script>-->