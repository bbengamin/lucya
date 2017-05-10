<?php echo $header; ?>
<div class="gallery">
  <div class="container">
     <?php if($single) { ?>
    <div class="gallery-header col-sm-12"><?php echo $heading_title; ?></div>
    <?php } else { ?>
      <div class="gallery-header col-sm-12">Галерея</div>
        <ul class="nav nav-tabs">
          <?php $i=0; foreach($gallery as $gall) { ?>
              <li class="<?php echo ($i==0) ? 'active' : ''; ?>"><a href="#tab-gallery<?php echo $gall['gallery_id']; ?>" data-toggle="tab"><?php echo $gall['name']; ?></a></li>
          <?php $i++; } ?>
        </ul>
    <?php } ?>
    
      <div class="tab-content">
      <?php $i=0; foreach($gallery as $gall) { ?>
      <div class="tab-pane <?php echo ($i==0) ? 'active' : ''; ?>" id="tab-gallery<?php echo $gall['gallery_id']; ?>">
        <div data-id='<?php echo $gall['gallery_id']; ?>' class='images-wrappPage'>
          <?php echo $gall['images']; ?>
        </div>
          <?php if($gall['ajax_load'] != 'false' ) { ?>
          <div class='gallery-btn col-sm-12'>
            <a data-page='2' data-id='<?php echo $gall['gallery_id']; ?>' data-href='<?php echo $gall['ajax_load']; ?>' class="lucya-btn ajax-galleryPage">Загрузить еще</a>
          </div>
          <?php }  ?>
      </div>  
      <?php $i++; } ?>
      </div>  
    
  </div>
</div>
<script>
  $(document).on('click', '.ajax-galleryPage', function(){
      var $self = $(this);
      var page = $(this).attr('data-page');
      var ajax_load = $(this).attr('data-href');
      var id = $(this).attr('data-id');
      
    	$.ajax({
  			url: decodeEntities(ajax_load + '&page=' + page),
  			type: 'get',
  			dataType: 'json',
  			success: function(json) {
  			  $('.images-wrappPage[data-id="' + id + '"]').append(json['images']);
  			  page ++;
  				$self.attr('data-page', page)
  				if(json['more'] == false){
  				  $('.ajax-galleryPage[data-id="' + id + '"]').hide();
  				}
  			}
  		});
  });
function decodeEntities(encodedString) {
    var textArea = document.createElement('textarea');
    textArea.innerHTML = encodedString;
    return textArea.value;
}
</script>
<?php echo $footer; ?>