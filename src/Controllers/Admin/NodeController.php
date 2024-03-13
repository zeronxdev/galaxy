<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Node;
use App\Utils\{
    Tools,
};
use Slim\Http\Response;
use Slim\Http\ServerRequest;

class NodeController extends AdminController
{
    public function index(ServerRequest $request, Response $response, array $args): Response
    {
        $table_config['total_column'] = [
            
            'id'                      => 'ID',
            'online'                  => 'Trạng thái<i class="bi bi-question-circle ms-1" data-bs-toggle="tooltip" title="Màu đỏ là ngoại tuyến, màu xanh là trực tuyến"></i>',
            'name'                    => 'Tên máy chủ',
            'online_user'             => 'Đang online',           
            'type'                    => 'Loại',
            'node_ip'                 => 'IP Máy chủ',
            'node_class'              => 'Nhóm nút',
            'node_speedlimit'         => 'Giới hạn tốc độ',
            'status'                  => 'Hiện/Ẩn',
            'action'                  => 'Thao tác',
        ];
        $table_config['ajax_url'] = 'node/ajax';

        $this->view()
            ->assign('table_config', $table_config)
            ->display('admin/node/node.tpl');
        return $response;
    }

    public function createNodeIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $this->view()->display('admin/node/create.tpl');
        return $response;
    }

    public function createNode(ServerRequest $request, Response $response, array $args): Response
    {
        $nodeData               = $request->getParsedBody();

        try {
            if (is_null($nodeData['custom_config']) || empty($nodeData['custom_config'])) {
                throw new \Exception('Cấu hình máy chủ không được để trống');
            }
            if (empty($nodeData['name'])) {
                throw new \Exception('Tên máy chủ không được để trống');
            }
            if (empty($nodeData['server'])) {
                throw new \Exception('Địa chỉ máy chủ không được để trống');
            }
            if ($nodeData['traffic_rate'] == '' || $nodeData['traffic_rate'] <= 0 || (string)(int)$nodeData['traffic_rate'] !== $nodeData['traffic_rate']) {
                throw new \Exception('Tỉ lệ tính lưu lượng không hợp lệ');
            }
            if ($nodeData['node_group'] == '' || $nodeData['node_group'] < 0 || (string)(int)$nodeData['node_group'] !== $nodeData['node_group']) {
                throw new \Exception('Nhóm nút không hợp lệ');
            }
            if ($nodeData['node_speedlimit'] == '' || $nodeData['node_speedlimit'] < 0 || (string)(int)$nodeData['node_speedlimit'] !== $nodeData['node_speedlimit']) {
                throw new \Exception('节点端口速度不能为空, 且不能为负数和非整数');
            }
            if (empty($nodeData['node_flag'])) {
                throw new \Exception('节点国家旗帜不能为空');
            }
            if (empty($nodeData['node_type'])) {
                throw new \Exception('节点类型不能为空');
            }
            if ($nodeData['node_class'] == '' || $nodeData['node_class'] < 0 || (string)(int)$nodeData['node_class'] !== $nodeData['node_class']) {
                throw new \Exception('节点等级不能为空, 且不能为负数和非整数');
            }
            if ($nodeData['node_traffic_limit'] == '' || $nodeData['node_traffic_limit'] < 0 || (string)(int)$nodeData['node_traffic_limit'] !== $nodeData['node_traffic_limit']) {
                throw new \Exception('节点流量消耗上限不能为空, 且不能为负数和非整数');
            }
            if ($nodeData['node_traffic_limit_reset_date'] == '' || $nodeData['node_traffic_limit_reset_date'] < 0 || (string)(int)$nodeData['node_traffic_limit_reset_date'] !== $nodeData['node_traffic_limit_reset_date']) {
                throw new \Exception('节点流量消耗上限重置时间不能为空, 且不能为负数和非整数');
            }
        } catch (\Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $e->getMessage(),
            ]);
        }

        $node                                = new Node();
        $node->name                          = $nodeData['name'];
        $node->server                        = trim($nodeData['server']);
        $node->node_ip                       = $nodeData['node_ip'];
        $node->traffic_rate                  = $nodeData['traffic_rate'];
        $node->status                        = 0;
        $node->node_group                    = $nodeData['node_group'];
        $node->node_speedlimit               = $nodeData['node_speedlimit'];
        $node->node_flag                     = $nodeData['node_flag'];
        $node->node_type                     = $nodeData['node_type'];
        $node->custom_config                 = json_encode($nodeData['custom_config']);
        $node->node_class                    = $nodeData['node_class'];
        $node->node_sort                     = $nodeData['node_sort'];
        $node->node_traffic_limit            = $nodeData['node_traffic_limit'] * 1024 * 1024 * 1024;
        $node->node_traffic_limit_reset_date = $nodeData['node_traffic_limit_reset_date'];
        $node->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Thêm máy chủ thành công'
        ]);
    }

    public function updateNodeIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $args['id'];
        $node = Node::find($id);
        $this->view()
            ->assign('node', $node)
            ->display('admin/node/edit.tpl');
        return $response;
    }

    public function updateNode(ServerRequest $request, Response $response, array $args): Response
    {
        $nodeData = $request->getParsedBody();
        try {
            if (empty($nodeData['id'])) {
                throw new \Exception('无效节点');
            }
            if (is_null($nodeData['custom_config']) || empty($nodeData['custom_config'])) {
                throw new \Exception('Cấu hình máy chủ không được để trống');
            }
            if (empty($nodeData['name'])) {
                throw new \Exception('Tên máy chủ không được để trống');
            }
            if (empty($nodeData['server'])) {
                throw new \Exception('Địa chỉ máy chủ không được để trống');
            }
            if ($nodeData['traffic_rate'] == '' || $nodeData['traffic_rate'] <= 0 || (string)(int)$nodeData['traffic_rate'] !== $nodeData['traffic_rate']) {
                throw new \Exception('Tỉ lệ tính lưu lượng không hợp lệ');
            }
            if ($nodeData['node_group'] == '' || $nodeData['node_group'] < 0 || (string)(int)$nodeData['node_group'] !== $nodeData['node_group']) {
                throw new \Exception('Nhóm máy chủ không hợp lệ');
            }
            if ($nodeData['node_speedlimit'] == '' || $nodeData['node_speedlimit'] < 0 || (string)(int)$nodeData['node_speedlimit'] !== $nodeData['node_speedlimit']) {
                throw new \Exception('Giới hạn tốc độ máy chủ không hợp lệ');
            }
            if (empty($nodeData['node_flag'])) {
                throw new \Exception('Cờ quốc gia của máy chủ không được để trống');
            }
            if (empty($nodeData['node_type'])) {
                throw new \Exception('Loại máy chủ không được để trống');
            }
            if ($nodeData['node_class'] == '' || $nodeData['node_class'] < 0 || (string)(int)$nodeData['node_class'] !== $nodeData['node_class']) {
                throw new \Exception('Cấp độ máy chủ không hợp lệ');
            }
            if ($nodeData['node_traffic_limit'] == '' || $nodeData['node_traffic_limit'] < 0 || (string)(int)$nodeData['node_traffic_limit'] !== $nodeData['node_traffic_limit']) {
                throw new \Exception('Giới hạn lưu lượng không hợp lệ');
            }
            if ($nodeData['node_traffic_limit_reset_date'] == '' || $nodeData['node_traffic_limit_reset_date'] < 0 || (string)(int)$nodeData['node_traffic_limit_reset_date'] !== $nodeData['node_traffic_limit_reset_date']) {
                throw new \Exception('Ngày làm mới lưu lượng không hợp lệ');
            }
        } catch (\Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $e->getMessage(),
            ]);
        }

        $id                                  = $nodeData['id'];
        $node                                = Node::find($id);
        $node->name                          = $nodeData['name'];
        $node->node_group                    = $nodeData['node_group'];
        $node->server                        = trim($nodeData['server']);
        $node->node_ip                       = $nodeData['node_ip'];
        $node->traffic_rate                  = $nodeData['traffic_rate'];
        $node->node_speedlimit               = $nodeData['node_speedlimit'];
        $node->node_type                     = $nodeData['node_type'];
        $node->custom_config                 = json_encode($nodeData['custom_config']);
        $node->node_flag                     = $nodeData['node_flag'];
        $node->node_class                    = $nodeData['node_class'];
        $node->node_sort                     = $nodeData['node_sort'];
        $node->node_traffic_limit            = $nodeData['node_traffic_limit'] * 1024 * 1024 * 1024;
        $node->node_traffic_limit_reset_date = $nodeData['node_traffic_limit_reset_date'];
        $node->save();

        return $response->withJson([
            'ret' => 1,
            'msg' => 'Sửa đổi thành công'
        ]);
        
    }

    public function nodeAjax(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Node::getTableDataFromAdmin(
            $request,
            static function (&$order_field) {
                if (in_array($order_field, ['action'])) {
                    $order_field = 'id';
                }
                if (in_array($order_field, ['name'])) {
                    $order_field = 'id';
                }
            }
        );

        $data = $query['datas']->map(function($rowData) {
            return [
                'id'              => $rowData->id,
                'online'          => $rowData->online == 1 ? '<span class="badge badge-circle badge-success w-15px h-15px"></span>' : '<span class="badge badge-circle badge-danger w-15px h-15px"></span>',
                'name'            => $rowData->name,
                'online_user'     => $rowData->getNodeOnlineUserCount(),
                'type'            => $rowData->nodeType(),
                'node_ip'         => $rowData->node_ip,
                'node_class'      => $rowData->node_class,
                'node_speedlimit' => $rowData->node_speedlimit == 0 ? 'Không giới hạn' : $rowData->node_speedlimit,
                'status'          => $rowData->status(),
                'action'          => <<<EOT
                                        <div class="btn-group dropstart"><a class="btn btn-light-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Thao tác</a>
                                            <ul    class = "dropdown-menu">
                                            <li><a class = "dropdown-item" href = "node/update/{$rowData->id}">Chỉnh sửa</a></li>
                                            <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminDelete('node', {$rowData->id})">Xóa bỏ</a></li>
                                            </ul>
                                        </div>
                                    EOT,
            ];
        })->toArray();

        return $response->withJson([
            'draw'            => $request->getParsedBodyParam('draw'),
            'recordsTotal'    => Node::count(),
            'recordsFiltered' => $query['count'],
            'data'            => $data,
        ]);
    }

    public function updateNodeStatus(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $request->getParsedBodyParam('id');
        $status = $request->getParsedBodyParam('status');
        $node = Node::find($id);
        $node->status = $status;
        $node->save();
        return $response->withJson([
            'ret'   => 1,
            'msg'   => 'success'
        ]);
    }

    public function deleteNode(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $request->getParsedBodyParam('id');
        $node = Node::find($id);
        $node->delete();
        return $response->withJson([
            'ret' => 1,
            'msg' => 'Xóa thành công'
        ]);
    }

}
