<?php
class ControllerInformationGallery extends Controller {
	public function index() {
 
	    $this->document->addStyle('catalog/view/javascript/gallery/blueimp-gallery.min.css');
	    $this->document->addStyle('catalog/view/javascript/gallery/bootstrap-image-gallery.css');
	    $this->document->addScript('catalog/view/javascript/gallery/jquery.blueimp-gallery.min.js');
	    $this->document->addScript('catalog/view/javascript/gallery/bootstrap-image-gallery.js');
			
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
	
		$limit = 6;
	    
		$this->load->model('design/banner');
	  	$this->load->model('tool/image');
	    
		$data['heading_title'] = "Фотогалерея";
	    
	    if(isset($this->request->get['gallery_id'])){
	    	$data['single'] = true;
	    	
		    $gallerys = array();
		    $gallerys[] = $this->request->get['gallery_id'];
	    }else{
	    	$data['single'] = false;
	    	$gallerys = $this->config->get('config_gallery');
	    }
	    $data['gallery'] = array();
    	foreach($gallerys as $gallery){
    		$ff_data = array(
		    	'gallery_id' => $gallery,
		    	'page' => 1,
		    	'limit' => $limit
		  	);
		  	
	  		$results = $this->model_design_banner->getBanner($gallery);
	  	
  			if(count($results) > 6){
				$ajax_load = $this->url->link('information/gallery/loadMore', "gallery_id=" . $gallery);
			}else{
				$ajax_load = 'false';
			}
    		$data['gallery'][] = array(
    			'gallery_id' => $gallery,
    			'ajax_load' => $ajax_load,
    			'name' => $this->model_design_banner->getBannerName($gallery)['name'],
    			'images' =>  $this->loadImages($ff_data)
			);
    	}
		
		
	/*	
		$ff_data = array(
	    	'gallery_id' => $gallery_id,
	    	'page' => $page,
	    	'limit' => $limit
	  	);
		$data['images'] = $this->loadImages($ff_data);
		$results = $this->model_design_banner->getBanner($gallery_id);
		if(count($results) > 6){
			$data['ajax_load'] = $this->url->link('information/gallery/loadMore', "gallery_id=" . $gallery_id);
		}*/
    
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
	
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/gallery.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/gallery.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/gallery.tpl', $data));
		}
	}
	
	public function loadMore() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$limit = 6;

	    if(isset($this->request->get['gallery_id'])){
	    	$gallery_id = $this->request->get['gallery_id'];
	    }
	    
	    $ff_data = array(
	    	'gallery_id' => $gallery_id,
	    	'page' => $page,
	    	'limit' => $limit
	  	);
		$json['images'] = $this->loadImages($ff_data);
		$results = $this->model_design_banner->getBanner($gallery_id);
		if(count($results) > $page * $limit){
			$json['more'] = true;
		}else{
			$json['more'] = false;
		}
	    $this->response->setOutput(json_encode($json));
	}
	
	public function loadImages($data) {

		$gallery_id = $data['gallery_id'];
		$page = $data['page'];
		$limit = $data['limit'];
		
		if(isset($data['slider'])){
			$slider = $data['slider'];
		}else{
			$slider = false;
		}
		
		$this->load->model('design/banner');
	  	$this->load->model('tool/image');
	    
		$data['images'] = array();
		
		 $filter_data = array(
	    	'start'              => ($page - 1) * $limit,
			'limit'              => $limit
    	);
    	
		$results = $this->model_design_banner->getBanner($gallery_id, $filter_data);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				
				if($result['link']){
					$image = $result['link'];
				}else{
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				}
				
				$data['images'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
					'image' => $image
				);
			}
		}
		
		if($slider){
			return $this->load->view('default/template/information/gallery_images_slider.tpl', $data);
		}else{
			return $this->load->view('default/template/information/gallery_images.tpl', $data);
		}
	}
}