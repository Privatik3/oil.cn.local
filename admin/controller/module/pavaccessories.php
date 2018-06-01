<?php
/******************************************************
 * @package:   Pav Ajax Search module for Opencart 1.5.x
 * @version:   1.0
 * @author:    http://www.pavothemes.com
 * @copyright: Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @License :  GNU General Public License version 2
*******************************************************/
class ControllerModulePavaccessories extends Controller {

	private $error = array();

	private $data;

	public function index() {

		$this->data['objlang'] = $this->language;
		$this->data['objurl'] = $this->url;

		$this->load->language('module/pavaccessories');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		$this->load->model('tool/image');
		$this->load->model('catalog/category');


		if( isset($this->request->get['module_id']) && isset($this->request->get['delete']) ){
			$this->model_extension_module->deleteModule( $this->request->get['module_id'] );
			$this->response->redirect($this->url->link('module/pavaccessories', 'token=' . $this->session->data['token'], 'SSL'));
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {


			$action = isset($this->request->post["action"]) ? $this->request->post["action"] : "";
			unset($this->request->post['pavaccessories_module']['action']);

		 	$data = array();
			foreach ($this->request->post['pavaccessories_module'] as $key => $value) {
		 	 	$data = $value;
		 	 	break;
		 	}


			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('pavaccessories', $data );
			} else {
				$this->model_extension_module->editModule( $this->request->get['module_id'], $data );
			}

			$this->session->data['success'] = $this->language->get('text_success');
			if( isset($this->request->get['module_id']) ) {
				$this->response->redirect($this->url->link('module/pavaccessories', 'module_id='.$this->request->get['module_id'].'&token=' . $this->session->data['token'], 'SSL'));
			}else{
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}


		$this->initData();
		$this->breadcrumbs();


		$this->data['modules'] = array();

		if (isset($this->request->post['pavgallery_status'])) {
			$this->data['pavaccessories_status'] = $this->request->post['pavgallery_status'];
		} else {
			$this->data['pavaccessories_status'] = $this->config->get('pavgallery_status');
		}

		$default = array(
			'module_title' 		=> '',
			'show_title'    	=> 1,
			'categories'        => array(),
			'itemsperpage'	   	=> 6,
			'cols'	   			=> 3,
			'itemsperpage'	   	=> 12,
			'numbersubcat'	   	=> 5,
			'module_class'	   	=> '',
			'name'		   	 	=> ''
		);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
			$module_info = array_merge( $default, $module_info );
			$this->data['selectedid'] = $this->request->get['module_id'];


			$this->data['subheading'] = $this->language->get('text_edit_module') . $module_info['name'];
			$this->data['action'] = $this->url->link('module/pavaccessories', 'module_id='.$this->request->get['module_id'].'&token=' . $this->session->data['token'], 'SSL');
		}else {
			$module_info = $default;
			$this->data['selectedid'] = 0;
			$this->data['subheading'] = $this->language->get('text_create_new_module');
			$this->data['action'] = $this->url->link('module/pavaccessories', 'token=' . $this->session->data['token'], 'SSL');
		}

		$modules = array( 0=> $module_info );

		$moduletabs = $this->model_extension_module->getModulesByCode( 'pavaccessories' );
	 	$this->data['link'] = $this->url->link('module/pavaccessories', 'token=' . $this->session->data['token'] . '', 'SSL');
 		$this->data['modules'] = $modules;


 		$this->data['moduletabs'] = $moduletabs;


 		$this->data['olang']  = $this->language;

		foreach ($modules as &$module) {
			if (isset($module['categories'])) {
				foreach ($module['categories'] as $category_id) {
					$category_info = $this->model_catalog_category->getCategory($category_id);
					unset($module['categories']);
					if ($category_info) {
						$module['categories_tmp'][] = array(
							'category_id' => $category_info['category_id'],
							'name'        => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']
						);
					}
				}
			}
		}

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->data['modules'] = $modules;

		$this->template = 'module/pavaccessories.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function initData() {

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');

		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_default_store'] = $this->language->get('entry_default_store');
		$this->data['entry_module_title'] = $this->language->get('entry_module_title');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_module_class'] = $this->language->get('entry_module_class');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_item'] = $this->language->get('entry_item');

		$this->data['entry_number_category'] = $this->language->get('entry_number_category');


		$this->data['tab_module'] = $this->language->get('tab_module');

		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_module_add'] = $this->language->get('button_module_add');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_save_stay'] = $this->language->get('text_save_edit');
		$this->data['button_save'] = $this->language->get('button_save');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}


		$this->data['action'] = $this->url->link('module/pavaccessories', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->post['pavaccessories_status'])) {
			$this->data['pavaccessories_status'] = $this->request->post['pavaccessories_status'];
		} else {
			$this->data['pavaccessories_status'] = $this->config->get('pavaccessories_status');
		}

		$this->data['modules'] = array();

		//Get Data Layout
		$this->load->model('design/layout');
		$this->data['layouts'][] = array('layout_id'=>99999, 'name' => $this->language->get('all_page') );
		$this->data['layouts'] = array_merge($this->data['layouts'],$this->model_design_layout->getLayouts());

		//Get Language
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
	}

	public function render(){

		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');


		$this->data['objlang'] = $this->language;
		$this->data['olang'] = $this->language;

		return $this->load->view( $this->template, $this->data) ;
	}

	public function redirect( $url ){
		return $this->response->redirect( $url );
	}

	protected function breadcrumbs() {
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/pavaccessories', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/pavaccessories')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
?>
