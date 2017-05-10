<div class="our-kitchen">
  <div class="container">
    <h3 class='gallery-header'><?php echo $heading_title; ?></h3>
    <div>
      <?php echo $description; ?>
    </div>
    <div class="clearfix">
      <div class="productes-box-wrap">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout col-xs-12">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php echo $product['price']; ?>
              </p>
              <?php } ?>
              <h4 class='name-product'><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p class='description-product'><?php echo $product['description']; ?></p>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>

  </div>
</div>
<script type="text/javascript">
$('.productes-box-wrap').owlCarousel({
	items: 4,
	autoPlay: false,
	singleItem: false,
	navigation: true,
	navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
	pagination: false
});
</script>