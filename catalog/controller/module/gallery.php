<?php
class ControllerModuleGallery extends Controller {
	public function index($setting) {

    $this->document->addStyle('catalog/view/javascript/gallery/blueimp-gallery.min.css');
    $this->document->addStyle('catalog/view/javascript/gallery/bootstrap-image-gallery.css');
    $this->document->addScript('catalog/view/javascript/gallery/jquery.blueimp-gallery.min.js');
    $this->document->addScript('catalog/view/javascript/gallery/bootstrap-image-gallery.js');
		
    static $module = 0;
    
		$this->load->model('design/banner');
    $this->load->model('tool/image');
    
    $ff_data = array(
    	'gallery_id' => $setting['filter_banner_id'],
    	'page' => 1,
    	'slider' => true,
    	'limit' => 6
  	);
		$data['images'] = $this->load->controller('information/gallery/loadImages', $ff_data);
    $data['description'] = $setting['description'];
		$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
		
		if($setting['show_more'] == 0){
    	$data['watch_more'] = $this->url->link('information/gallery', "gallery_id=" . $setting['filter_banner_id']);
		}else{
			$results = $this->model_design_banner->getBanner($setting['filter_banner_id']);
			if(count($results) > 6){
    		$data['ajax_load'] = $this->url->link('information/gallery/loadMore', "gallery_id=" . $setting['filter_banner_id']);
			}
		}
    
		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/gallery.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/gallery.tpl', $data);
		} else {
			return $this->load->view('default/template/module/gallery.tpl', $data);
		}
	}
  
  private function realname($filename) {
    if ($this->request->server['HTTPS']) {
			return $this->config->get('config_ssl') . 'image/' . $filename;
		} else {
			return $this->config->get('config_url') . 'image/' . $filename;
		}
  }
  
}