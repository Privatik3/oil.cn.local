<?php
/******************************************************
 * @package Pav bannermanager module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/


class ControllerModulePavaccessories extends Controller {

	private $data;

	public function index($setting) {
		static $module = 0;

		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->language->load('module/pavaccessories');

		$language = $this->config->get('config_language_id');

		$default = array(
			'module_class' => 'prefix_class',
			'module_title' => array(),
			'show_title'   => 1,
			'categories'   => array(),
			'itemsperpage' => '6',
			'cols'         => '3',
			'limit'        => '12',
			'numbersubcat' => '5',
		);

		$data  = array_merge($default, $setting);

		$categories = array();

		foreach ($data['categories'] as $category_id) {
			$category_info = $this->model_catalog_category->getCategory($category_id);

			$datap = array(
				'filter_category_id'  => $category_info['category_id'],
				'filter_sub_category' => true
			);

			$product_total = $this->model_catalog_product->getTotalProducts($datap);

			if ($category_info) {
				$categories[$category_id]['parent'] = array(
					'image' => $category_info['image'],
					'href' => $this->url->link('product/category', 'path=' . $category_info['category_id'])	,
					'name' =>(isset($category_info['path']) ? $category_info['path'] . ' &gt; ' : '') . $category_info['name'],
					'count' => $product_total,
				);
			}
			$categories[$category_id]['haschild'] = $this->rendercategory($category_id);
		}


		$this->data['module_class'] = $data['module_class'];
		$this->data['module_title'] = $data['module_title'][$language];
		$this->data['language']     = $language;
		$this->data['show_title']   = $data['show_title'];

		$this->data['itemsperpage'] = $data['itemsperpage'];
		$this->data['cols']         = $data['cols'];
		$this->data['limit']        = $data['limit'];
		$this->data['numbersubcat'] = $data['numbersubcat'];

		$this->data['categories']   = $categories;
		
		$this->data['model_tool_image'] =  $this->model_tool_image;


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavaccessories.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/pavaccessories.tpl', $this->data);
		} else {
			return $this->load->view('default/template/module/pavaccessories.tpl', $this->data);
		}
	}

	public function rendercategory($category_id) {
		$this->load->model('catalog/category');
		$categories = $this->model_catalog_category->getCategories($category_id);

		$result = array();

		foreach ($categories as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));

			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

				$product_total = $this->model_catalog_product->getTotalProducts($data);

				$total += $product_total;

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
				);
			}

			$result[] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
		}

		return $result;
	}
}
?>