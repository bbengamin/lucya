<?php
class ModelDesignBanner extends Model {
	public function getBannerName($banner_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "banner WHERE banner_id=" . $banner_id;	
		$query = $this->db->query($sql);

		return $query->row;
	}
	public function getBanner($banner_id, $data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "banner_image bi LEFT JOIN " . DB_PREFIX . "banner_image_description bid ON (bi.banner_image_id  = bid.banner_image_id) WHERE bi.banner_id = '" . (int)$banner_id . "' AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bi.sort_order ASC";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 6;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);

		return $query->rows;
	}
}