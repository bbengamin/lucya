<?php echo $header; ?>
<div class="container">
  <div class="row product-page"><?php echo $column_left; ?>
    <div id="content"><?php echo $content_top; ?>
      <div class="row product-page">
        <div>
          <div class="pages-of-products-box">
            <?php if($prev) { ?>
              <a class='pages-of-products-item' href='<?php echo $prev; ?>'><i class="material-icons">arrow_back</i> Предыдущий продукт</a>
            <?php } ?>
            <?php if($next) { ?>
              <a class='pages-of-products-item' href='<?php echo $next; ?>'>Следующий продукт <i class="material-icons">arrow_forward</i></a>
            <?php } ?>
          </div>
          <div class="info-pr-wrap row">
          <div class="main-images-product-box col-sm-6">
              <?php if ($thumb || $images) { ?>
              <div class="main-img-box">
                <?php if ($thumb) { ?>
                <div><a class="main-img-item" href="<?php echo $popup; ?>" data-fancybox="Галерея" data-caption="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                <?php } ?>
              </div>
              <div class="additional-box-images">
              <?php if ($images) { ?>
                <div class="slider-of-additionals-images">
                  <?php foreach ($images as $image) { ?>
                  <div class="additional-inner-item-wrap"><a class="additional-inner-item" data-fancybox="Галерея" data-caption="<?php echo $heading_title; ?>" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>
                  <?php } ?>
                </div>  
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <div class='main-info-product-box col-sm-6'>
              <h1><?php echo $heading_title; ?></h1>
              <?php if ($price) { ?>
              <ul class="list-unstyled">
                <?php if (!$special) { ?>
                <li>
                  <h2 class='main-prices-pr-page'><?php echo $price; ?></h2>
                </li>
                <?php } else { ?>
                <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
                <li>
                  <h2 class='main-prices-pr-page'><?php echo $special; ?></h2>
                </li>
                <?php } ?>
              </ul>
              <?php } ?>
              <p><?php echo $description; ?></p>
            </div>
            </div>
          </div>
          
            <?php if ($review_status) { ?>
            <div class='reviewses-box clearfix'>
              <div class="row">
              <form class="form-horizontal col-sm-6" id="form-review">
                
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-left">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="call-back-btn"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
              <div class="col-sm-6">
                <div id="review"></div>
              </div>
              </div>
            </div>
            <?php } ?>
          </div>
        
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    
    
</div>
<script type="text/javascript">
$('.slider-of-additionals-images').owlCarousel({
	items: 3,
	autoPlay: false,
	singleItem: false,
	navigation: true,
	navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
	pagination: false
});
</script>
<script type="text/javascript">

$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});
$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
</script>
<?php echo $footer; ?>
