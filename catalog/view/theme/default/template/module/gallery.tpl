<div class="gallery">
  <div class="clearfix">
    <div class="gallery-header col-sm-12"><?php echo $heading_title; ?></div>
    <div><?php echo $description; ?></div>
    <div class='images-wrapp<?php echo $module; ?> col-sm-12'>
      <div class="row">
       <?php echo $images; ?>
     </div>
    </div>
    <?php if(isset($watch_more)) { ?>
    <div class='gallery-btn col-sm-12'>
      <a class="lucya-btn" href="<?php echo $watch_more; ?>">Смотреть все</a>
    </div>
    <?php } else if(isset($ajax_load)) {/* ?>
    <div class='gallery-btn col-sm-12'>
      <a class="lucya-btn" id='ajax-gallery<?php echo $module; ?>'>Загрузить еще</a>
    </div>
    <?php */ }  ?>
  </div>
</div>
<script>
<?php if(isset($ajax_load)) { ?>
  var page<?php echo $module; ?> = 2;
  $(document).on('click', '#ajax-gallery<?php echo $module; ?>', function(){
    	$.ajax({
  			url: decodeEntities('<?php echo $ajax_load; ?>&page=' + page<?php echo $module; ?>),
  			type: 'get',
  			dataType: 'json',
  			success: function(json) {
  			  $('.images-wrapp<?php echo $module; ?>').append(json['images']);
  				page<?php echo $module; ?> ++;
  				if(json['more'] == false){
  				  $('#ajax-gallery<?php echo $module; ?>').hide();
  				}
  			}
  		});
  });
<?php }  ?>
function decodeEntities(encodedString) {
    var textArea = document.createElement('textarea');
    textArea.innerHTML = encodedString;
    return textArea.value;
}
</script>
<!--
<?php if (!empty($heading_title)) { ?>
  <h3><?php echo $heading_title; ?></h3>
<?php } ?>
<div class="row">
  <div id="links<?php echo $module; ?>">
    <?php foreach ($images as $gimage) { ?>
      <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
        <div class="image"><a href="<?php echo $gimage['image']; ?>" title="<?php echo $gimage['title']; ?>" data-gallery="#blueimp-gallery-links<?php echo $module; ?>"><img src="<?php echo $gimage['thumb']; ?>" alt="<?php echo $gimage['title']; ?>" title="<?php echo $gimage['title']; ?>" class="img-responsive" /></a></div>
        <?php if ($thumb_title) { ?>
        <h4><?php echo $gimage['title']; ?></h4>
        <?php } ?>
      </div>
    <?php } ?>
  </div>
</div>

<?php if ($module === 0) { ?>
      <div id="blueimp-gallery" class="blueimp-gallery">
      <div class="slides"></div>
      <h3 class="title"></h3>
      <a class="prev">‹</a>
      <a class="next">›</a>
      <a class="close" style="-webkit-transform: scale(2); -moz-transform: scale(2); -ms-transform: scale(2); -o-transform: scale(2); transform: scale(2);">×</a>
      <a class="play-pause" style="-webkit-transform: scale(2); -moz-transform: scale(2); -ms-transform: scale(2); -o-transform: scale(2); transform: scale(2);"></a>
      <ol class="indicator"></ol>
      <div class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" aria-hidden="true">&times;</button>
                <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body next"></div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default pull-left prev">
                    <i class="glyphicon glyphicon-chevron-left"></i>
                    Previous
                  </button>
                  <button type="button" class="btn btn-primary next">
                    Next
                    <i class="glyphicon glyphicon-chevron-right"></i>
                  </button>
                </div>
              </div>
            </div>
        </div>
      </div>
<script type="text/javascript">
$('#blueimp-gallery').data('useBootstrapModal', 0);
$('#blueimp-gallery').toggleClass('blueimp-gallery-controls', 0);
</script>
<?php } ?>

-->