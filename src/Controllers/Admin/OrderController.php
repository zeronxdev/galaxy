<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Order;
use App\Models\Product;
use App\Models\Setting;
use App\Models\User;
use App\Controllers\OrderController as UserOrder;
use Pkly\I18Next\I18n;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

class OrderController extends AdminController
{
    public function index(ServerRequest $request, Response $response, array $args): Response
    {
        $table_config['total_column'] = [
            'id'            => 'ID',
            'user_id'       => 'User ID',
            'order_total'   => 'Số tiền',
            'order_status'  => 'Trạng thái',
            'order_no'      => 'Mã đơn hàng',
            'created_time'  => 'Thời gian tạo',
            'order_payment' => 'Kiểu thanh toán',
            'order_type'    => 'Loại đơn hàng',
            'action'        => 'Thao tác',
        ];
        $table_config['ajax_url'] = 'order/ajax';
        $this->view()
            ->assign('table_config', $table_config)
            ->display('admin/order.tpl');
        return $response;
    }

    public function ajaxOrder(ServerRequest $request, Response $response, array $args): Response
    {
        $query = Order::getTableDataFromAdmin(
            $request,
            static function (&$order_field) {
                if (in_array($order_field, ['order_payment'])) {
                    $order_field = 'id';
                }
            }
        );

        $data = $query['datas']->map(function($rowData) {
            $adminPath = Setting::obtain('website_admin_path');
            return [
                'id'            => $rowData->id,
                'user_id'       => $rowData->user_id,
                'order_total'   => $rowData->order_total,
                'order_status'  => $rowData->status(),
                'order_no'      => $rowData->order_no,
                'created_time'  => date('Y-m-d H:i:s', $rowData->created_at),
                'order_payment' => $rowData->payment(),
                'order_type'    => $rowData->orderType(),
                'action'        => <<<EOT
                                        <div class="btn-group dropstart"><a class="btn btn-light-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-expanded="false">Thao tác</a>
                                            <ul    class = "dropdown-menu">
                                            <li><a class = "dropdown-item" type = "button" onclick = "completeOrder({$rowData->id})">Đánh dấu hoàn tất</a></li>
                                            <li><a class = "dropdown-item" type = "button" onclick = "zeroAdminDelete('order', {$rowData->id})">Xóa bỏ</a></li>
                                            <li><a class = "dropdown-item" href = "/{$adminPath}/order/{$rowData->order_no}">Chi tiết</a></li>
                                            </ul>
                                        </div>
                                    EOT,
            ];
        })->toArray();

        return $response->withJson([
            'draw'            => $request->getParsedBodyParam('draw'),
            'recordsTotal'    => Order::count(),
            'recordsFiltered' => $query['count'],
            'data'            => $data,
        ]);
    }

    public function orderDetailIndex(ServerRequest $request, Response $response, array $args): Response
    {
        $id = $args['no'];
        $order = Order::where('order_no', $id)->first();
        if (!is_null($order->product_id) && $order->order_type != '2') {
            $product = Product::find($order->product_id);
            $product_name = $product->name;
            $order_type = [
                1   =>  I18n::get()->t('purchase product') .  ': ' . $product_name . '-' . $product->productPeriod($order->product_price),
                3   =>  I18n::get()->t('renewal product') .': ' . $product_name . '-' . $product->productPeriod($order->product_price),
                4   =>  I18n::get()->t('upgrade product') .': ' . $product_name . '-' . $product->productPeriod($order->product_price),
            ];
        } else {
            $product_name = '';
            $product = [];
            $order_type = [
                2   =>  I18n::get()->t('add credit') .': ' . $order->order_total,
            ];
        }

        
        $this->view()
            ->assign('order', $order)
            ->assign('order_type', $order_type)      
            ->display('admin/order_detail.tpl');
        return $response;
    }

    public function completeOrder(ServerRequest $request, Response $response, array $args): Response
    {
        $order_id = $request->getParsedBodyParam('order_id');
        $order    = Order::find($order_id);
        $order_no = $order->order_no;
        UserOrder::execute($order_no);
        return $response->withJson([
            'ret' => 1,
            'msg' => 'success'
        ]);
    }

    public function deleteOrder(ServerRequest $request, Response $response, array $args): Response
    {
        $order_id = $request->getParsedBodyParam('id');
        $order    = Order::find($order_id);
        $order->delete();
        return $response->withJson([
            'ret' => 1,
            'msg' => 'success'
        ]);
    }

    public function createOrder(ServerRequest $request, Response $response, array $args): Response
    {
        $postData       = $request->getParsedBody();
        $user_id        = $postData['id'];
        $product_id     = $postData['product_id'];
        $product_period = $postData['product_period'];
        $order_total    = $postData['order_total'];
        $user           = User::find($user_id);
        $product        = Product::find($product_id);
        $order          = new Order();

        try {
            if (is_null($product->productPrice($product_period))) {
                throw new \Exception('选定的产品周期的价格未设置');
            }
            $order->order_no       = UserOrder::createOrderNo();
            $order->user_id        = $user->id;
            $order->product_id     = $product->id;
            $order->order_type     = 1;
            $order->product_price  = $product->productPrice($product_period);
            $order->product_period = $product_period;
            $order->order_total    = ($order_total == '' ? $order->product_price : $order_total);
            $order->order_status   = 1;
            $order->created_at     = time();
            $order->updated_at     = time();
            $order->expired_at     = time() + 600;
            $order->execute_status = 0;
            $order->save();
        } catch (\Exception $e) {
            return $response->withJson([
                'ret' => 0,
                'msg' => $e->getMessage(),
            ]);
        }

        return $response->withJson([
            'ret' => 1,
            'msg'   =>  'Thành công'
        ]);
    }
}