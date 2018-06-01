<?php
class ControllerModulePavrecentlyviewed extends Controller {

	public  $data = array();

	public function index($setting) {

		$viewed_products = array();
		
		if (isset($this->request->cookie['pavviewed'])) {
			$viewed_products = explode(',', $this->request->cookie['pavviewed']);
		} else if (isset($this->session->data['pavviewed'])) {
			$viewed_products = $this->session->data['pavviewed'];
		}
		
		if ( isset($this->request->get['product_id']) ) {
			
			$product_id = $this->request->get['product_id'];

			// get diference product_id   
			$viewed_products = array_diff($viewed_products, array($product_id));
			
			array_unshift($viewed_products, $product_id);
			
			setcookie("pavviewed", implode(',',$viewed_products), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);

			if (!isset($this->session->data['pavviewed']) || $this->session->data['pavviewed'] != $viewed_products) {
				$this->session->data['pavviewed'] = $viewed_products;
			}
		} 

		//var_dump($viewed_products); die;

		$viewed_count = isset($setting['items'])?$setting['items']:5;
		
		$products = array();
			
		if (isset($viewed_count) && $viewed_count > 0) {
			for ($i = 0; $i < $viewed_count; $i++) {
				if (isset($viewed_products[$i])) {
					$products[] = $viewed_products[$i];
				}
			}
		}

		$this->language->load('module/pavrecentlyviewed');

		$language = $this->config->get('config_language_id');

		$this->data['heading_title'] = isset($setting['title'][$language])?$setting['title'][$language]:$this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');

		$this->data['mode'] = isset($setting['mode'])?$setting['mode']:"";

		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$data = array(
			'image_width' => isset($setting['image_width'])?$setting['image_width']:'80', 
			'image_height' => isset($setting['image_height'])?$setting['image_height']:'80'
		);


		$this->getProducts($products, $data);



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavrecentlyviewed.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/pavrecentlyviewed.tpl', $this->data);
		} else {
			return $this->load->view('default/template/module/pavrecentlyviewed.tpl', $this->data);
		}
	}

	public function getProducts($products, $data) {
		$this->data['products'] = array();

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $data['image_width'], $data['image_height']);
				} else {
					$image = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
				);
			}
		}
	}
}
?>