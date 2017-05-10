<?php
class ControllerCommonAjax extends Controller {
	
	public function banket(){

		$json = array();

		if(!isset($this->request->post['name']) || strlen($this->request->post['name']) == 0){
			$json['error']['name'] = "Введите корректное имя";
		}

		if(isset($this->request->post['phone'])){
			if(!isset($this->request->post['phone']) || strlen($this->request->post['phone']) == 0){
				$json['error']['phone'] = "Введите корректный телефон";
			}
		}
		
		if(isset($this->request->post['date'])){
			if (strlen($this->request->post['date']) == 0) {
				$json['error']['date'] = "Выберите дату";
			}
		}

		if(!$json){

			$text = "Банкеты \n\n";
			$text .= "Имя:" . $this->request->post['name'] . "\n";
			
			if(isset($this->request->post['phone'])){
				$text .= "телефон:" . $this->request->post['phone'] . "\n";
			}
			
			if(isset($this->request->post['date'])){
				$text .= "Дата:" .  $this->request->post['date'] . "\n";
			}

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode("Обратный звонок", ENT_QUOTES, 'UTF-8'));
			$mail->setText($text);
			$mail->send();

			$emails = explode(',', $this->config->get('config_mail_alert'));

			foreach ($emails as $email) {
				if ($email && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}

			$json['success'] = 'success';
		}
		$this->response->setOutput(json_encode($json));
	}
	public function order(){

		$json = array();

		if(!isset($this->request->post['name']) || strlen($this->request->post['name']) == 0){
			$json['error']['name'] = "Введите корректное имя";
		}

		if(isset($this->request->post['phone'])){
			if(!isset($this->request->post['phone']) || strlen($this->request->post['phone']) == 0){
				$json['error']['phone'] = "Введите корректный телефон";
			}
		}
		
		if(isset($this->request->post['date'])){
			if (strlen($this->request->post['date']) == 0) {
				$json['error']['date'] = "Выберите дату";
			}
		}

		if(!$json){

			$text = "Заказ столика \n\n";
			$text .= "Имя:" . $this->request->post['name'] . "\n";
			
			if(isset($this->request->post['phone'])){
				$text .= "телефон:" . $this->request->post['phone'] . "\n";
			}
			
			if(isset($this->request->post['date'])){
				$text .= "Дата:" .  $this->request->post['date'] . "\n";
			}

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode("Обратный звонок", ENT_QUOTES, 'UTF-8'));
			$mail->setText($text);
			$mail->send();

			$emails = explode(',', $this->config->get('config_mail_alert'));

			foreach ($emails as $email) {
				if ($email && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}

			$json['success'] = 'success';
		}
		$this->response->setOutput(json_encode($json));
	}

}
