<div class="section section top-slide-box">
   <div id="slideshow<?php echo $module; ?>" class="home-page-slider owl-carousel" style="opacity: 1;">
      <?php foreach ($banners as $banner) { ?>
      <div class="item item_1">
          <img src="<?php echo $banner['image']; ?>" alt="" class="img-responsive" />
          <div class="container slider-container">
            <?php echo $banner['title']; ?>
          </div>
      </div>
      <?php } ?>
  </div>
</div>

<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: false,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
	pagination: false
});
--></script>