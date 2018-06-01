<?php 

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu_params' and `key` = 'pavmegamenu_params'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu_params', 'pavmegamenu_params', '[{\"id\":2,\"group\":0,\"cols\":\"\",\"subwidth\":775,\"submenu\":1,\"align\":\"aligned-fullwidth\",\"rows\":[{\"cols\":[{\"widgets\":\"wid-14\",\"colwidth\":4},{\"widgets\":\"wid-15\",\"colwidth\":5},{\"widgets\":\"wid-16\",\"colwidth\":3}]}]},{\"submenu\":1,\"subwidth\":650,\"id\":5,\"align\":\"aligned-fullwidth\",\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-22\",\"colwidth\":12}]},{\"cols\":[{\"widgets\":\"wid-20\",\"colwidth\":12}]}]},{\"id\":7,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavverticalmenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavverticalmenu_params' and `key` = 'params'";
$query['pavverticalmenu'][] =" 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES

(0, 0, 'pavverticalmenu_params', 'params', '[{\"id\":2,\"group\":0,\"cols\":3,\"subwidth\":700,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-7\",\"colwidth\":4},{\"widgets\":\"wid-8\",\"colwidth\":8}]}]},{\"submenu\":\"1\",\"id\":5,\"subwidth\":600,\"cols\":1,\"group\":0,\"rows\":[{\"cols\":[{\"colwidth\":12,\"widgets\":\"wid-9\"}]}]},{\"id\":3,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES

(64, 14, 0, 'pavblog/%');

";
$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout` (`layout_id`, `name`) VALUES
(14, 'Pav Blog');
";
?>