<?php
class ControllerModulePavrecentlyviewed extends Controller {
	private $error = array();
	private $data;
	 
	public function index() {   
		$this->language->load('module/pavrecentlyviewed');

		$this->load->model('tool/image');
		$this->load->model('setting/setting');
		$this->load->model('localisation/language');
		$this->load->model('extension/module');
		$this->load->model('extension/extension');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('pavrecentlyviewed', $this->request->post);
				$this->response->redirect($this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				$this->response->redirect($this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'].'&module_id='.$this->request->get['module_id'], 'SSL'));
			}
			$this->session->data['success'] = $this->language->get('text_success');
		}

		$this->_language();
		$this->_alert();
		$this->_breadcrumbs();
		$this->_data();


 		// Render 
		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view('module/pavrecentlyviewed.tpl', $this->data));
	}

	public function _data(){

		if (isset($this->request->get['module_id'])) {
			$module_id = $this->request->get['module_id']; $url = '&module_id='.$module_id;
		} else {
			$module_id = ''; $url = '';
		}
		$this->data['module_id'] = $module_id;
		$this->data['extensions'] = $this->extensions("pavrecentlyviewed", "&module_id");

		$this->data['delete'] = $this->url->link('module/pavrecentlyviewed/ndelete', 'token=' . $this->session->data['token'].$url, 'SSL');
		if (!isset($this->request->get['module_id'])) {
			$this->data['action'] = $this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];

		// GET DATA SETTING
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}


		// NAME
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$this->data['name'] = $module_info['name'];
		} else {
			$this->data['name'] = '';
		}

		// title
		if (isset($this->request->post['title'])) {
			$this->data['title'] = $this->request->post['title'];
		} elseif (!empty($module_info)) {
			$this->data['title'] = $module_info['title'];
		} else {
			$this->data['title'] = '';
		}

		// image_width
		if (isset($this->request->post['image_width'])) {
			$this->data['image_width'] = $this->request->post['image_width'];
		} elseif (!empty($module_info)) {
			$this->data['image_width'] = $module_info['image_width'];
		} else {
			$this->data['image_width'] = '145';
		}

		// image_height
		if (isset($this->request->post['image_height'])) {
			$this->data['image_height'] = $this->request->post['image_height'];
		} elseif (!empty($module_info)) {
			$this->data['image_height'] = $module_info['image_height'];
		} else {
			$this->data['image_height'] = '71';
		}

		// items
		if (isset($this->request->post['items'])) {
			$this->data['items'] = $this->request->post['items'];
		} elseif (!empty($module_info)) {
			$this->data['items'] = $module_info['items'];
		} else {
			$this->data['items'] = '4';
		}

		// mode
		if (isset($this->request->post['mode'])) {
			$this->data['mode'] = $this->request->post['mode'];
		} elseif (!empty($module_info)) {
			$this->data['mode'] = $module_info['mode'];
		} else {
			$this->data['mode'] = 1;
		}

		// STATUS
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$this->data['status'] = $module_info['status'];
		} else {
			$this->data['status'] = 1;
		}
	}

	
	public function _language(){
		$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_display'] = $this->language->get('entry_display');

		$this->data['entry_width'] = $this->language->get('entry_width');
		$this->data['entry_height'] = $this->language->get('entry_height');

		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['entry_width_height'] = $this->language->get('entry_width_height');


		$this->data['entry_module_name'] = $this->language->get('entry_module_name');
		$this->data['entry_mode'] = $this->language->get('entry_mode');

		$this->data['help_entry_display'] = $this->language->get('help_entry_display');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_save_edit'] = $this->language->get('button_save_edit');

		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		$this->data['entry_show_image'] = $this->language->get( 'entry_show_image' );
		$this->data['entry_module_title'] = $this->language->get( 'entry_module_title' );
		$this->data['tab_module'] = $this->language->get('tab_module');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();
	}
	
	public function _alert(){
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
	}

	public function _breadcrumbs(){
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
			'href'      => $this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
	}

	public function ndelete(){
		$this->load->model('extension/module');
		$this->load->language('module/pavrecentlyviewed');
		if (isset($this->request->get['module_id'])) {
			$this->model_extension_module->deleteModule($this->request->get['module_id']);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}

	public function extensions($extension, $module_id){
		$module_data = array();
		$this->load->model('extension/extension');
		$this->load->model('extension/module');
		$extensions = $this->model_extension_extension->getInstalled('module');
		$modules = $this->model_extension_module->getModulesByCode($extension);
		foreach ($modules as $module) {
			$module_data[] = array(
				'module_id' => $module['module_id'],
				'name'      => $module['name'],
				'edit'      => $this->url->link('module/pavrecentlyviewed', 'token=' . $this->session->data['token'] . $module_id.'=' . $module['module_id'], 'SSL'),
				'delete'    => $this->url->link('extension/module/delete', 'token=' . $this->session->data['token'] . $module_id.'=' . $module['module_id'], 'SSL')
			);
		}
		$ex[] = array(
			'name'      => $this->language->get("create_module"),
			'module'    => $module_data,
			'edit'      => $this->url->link('module/' . $extension, 'token=' . $this->session->data['token'], 'SSL')
		);
		return $ex;
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/pavrecentlyviewed')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
