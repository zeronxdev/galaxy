<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>{$config["website_name"]} Người dùng</title>
        
        <meta charset="UTF-8" />
        <meta name="renderer" content="webkit" />
        <meta name="description" content="Updates and statistics" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="format-detection" content="telephone=no,email=no" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <meta http-equiv="expires" content="0">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
        <link href="/theme/galaxy/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/theme/galaxy/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/theme/galaxy/css/style.bundle.css" rel="stylesheet" type="text/css" />
        <link href="/favicon.png" rel="shortcut icon">
        <link href="/apple-touch-icon.png" rel="apple-touch-icon">
    </head>
	{include file ='admin/menu.tpl'}
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <div class="d-flex flex-column flex-column-fluid mt-10">
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <div id="kt_app_content_container" class="app-container container-xxl">

                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Quản lý người dùng</div>
                                            <div class="card-toolbar">
                                                <div class="d-flex align-items-center position-relative me-2 my-2">
                                                    <span class="svg-icon svg-icon-1 position-absolute ms-3"> 
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                        </svg>
                                                    </span>
                                                    <input type="text" data-kt-admin-table-filter="search" class="form-control form-control-solid w-150px ps-15" placeholder="Tìm kiếm"/>
                                                </div>
                                                <button class="btn btn-primary btn-sm fw-bold" data-bs-toggle="modal" data-bs-target="#zero_modal_create_user">
                                                    <i class="bi bi-cloud-plus fs-3"></i>Thêm người dùng
                                                </button>
                                            </div>
                                        </div>
                                        <div class="card-body" id="KTAdmin_node_record">
                                            {include file='table/table.tpl'}
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                        {include file='admin/footer.tpl'}
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->
        <div class="modal fade" id="zero_modal_create_user" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content rounded">
                    <div class="modal-header justify-content-end border-0 pb-0">
                        <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                            
                            <span class="svg-icon svg-icon-1">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                    <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                </svg>
                            </span>
                            
                        </div>
                    </div>
                    <div class="modal-body scroll-y pt-0 pb-15 px-5 px-xl-20">
                        <div class="mb-13 text-center">
                            <h1 class="mb-3">Thêm người dùng</h1>
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="d-flex align-items-center fs-6 fw-semibold mb-2" for="zero_create_user_email">
                                <span class="required">Email</span>
                            </label>                         
                            <input type="text" value="" class="form-control form-control-solid" placeholder="Nhập email người dùng" id="zero_create_user_email">
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="d-flex align-items-center fs-6 fw-semibold mb-2" for="zero_create_user_passwd">
                                <span class="required">Mật khẩu</span>
                            </label>
                            <input type="text" value="" class="form-control form-control-solid" placeholder="Để trống để giống với email" id="zero_create_user_passwd">
                        </div>                  
                        <div class="d-flex flex-center flex-row-fluid pt-12">
                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" data-kt-admin-update-ban-rule-action="submit" onclick="zeroCreateUser()">
                                <span class="indicator-label">Thêm</span>
                                <span class="indicator-progress">Vui lòng chờ
                                <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- modal order -->
        <div class="modal fade" id="zero_modal_create_order_for_user" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content rounded">
                    <div class="modal-header justify-content-end border-0 pb-0">
                        <div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
                            
                            <span class="svg-icon svg-icon-1">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                    <rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="currentColor" />
                                </svg>
                            </span>
                            
                        </div>
                    </div>
                    <div class="modal-body scroll-y pt-0 pb-15 px-5 px-xl-20">
                        <div class="mb-13 text-center">
                            <h1 class="mb-3">Gán đơn hàng</h1>
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="fw-6 fw-semibold mb-2" for="zero_create_order_user_id">
                                <span class="required">ID Người dùng</span>
                            </label>
                            <input class="form-control form-control-solid" type="text" value="" placeholder="ID Người dùng" id="zero_create_order_user_id">
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="fs-6 fw-semibold mb-2" for="zero_create_order_product_id">
                                <span class="required">Chọn gói dịch vụ</span>
                            </label>
                            <select class="form-select form-select-solid" data-control="select2" data-hide-search="true" id="zero_create_order_product_id" data-placeholder="Chọn gói dịch vụ">
                                <option></option>
                                {foreach $products as $product}
                                    <option value={$product->id}>{$product->name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="fs-6 fw-semibold mb-2" for="zero_create_order_product_period">
                                <span class="required">Chọn chu kỳ</span>
                            </label>
                            <select class="form-select form-select-solid" data-control="select2" data-hide-search="true" id="zero_create_order_product_period" data-placeholder="Chọn chu kỳ">
                                <option></option>
                                <option value="30">1 Tháng</option>
                                <option value="90">3 Tháng</option>
                                <option value="180">6 Tháng</option>
                                <option value="360">1 Năm</option>
                                <option value="9999">2 Năm</option>
                            </select>
                        </div>
                        <div class="d-flex flex-column mb-8">
                            <label class="fw-6 fw-semibold mb-2" for="zero_create_order_total">
                                <span class="required">Số tiền thanh toán</span>
                            </label>
                            <input class="form-control form-control-solid" type="text" value="" placeholder="Vui lòng nhập số tiền cần thanh toán, nếu để trống sẽ mặc định là giá sản phẩm" id="zero_create_order_total">
                        </div>              
                        <div class="d-flex flex-center flex-row-fluid pt-12">
                            <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary" data-kt-admin-update-ban-rule-action="submit" onclick="zeroCreateOrderForUser()">
                                <span class="indicator-label">Tạo đơn hàng</span>
                                <span class="indicator-progress">Vui lòng chờ
                                <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {include file='admin/script.tpl'}
        <script>
            window.addEventListener('load', () => {
                {include file='table/js_2.tpl'}
            })
        </script>
        <script>
            function zeroAdminUpdateUserStatus(type, id){
                switch (type){
                    case 'enable':
                        var enable = $("#user_enable_"+id).prop("checked") ? 1 : 0;
                        $.ajax({
                            type: "PUT",
                            url: "/{$config['website_admin_path']}/user/update/status/enable",
                            dataType: "JSON",
                            data: {
                                enable,
                                id,
                            },
                            success: function(data){}
                        });
                        break;
                    case 'is_admin':                      
                        var is_admin = $("#user_is_admin_"+id).prop("checked") ? 1 : 0;
                        $.ajax({
                            type: "PUT",
                            url: "/{$config['website_admin_path']}/user/update/status/is_admin",
                            dataType: "JSON",
                            data: {
                                is_admin,
                                id,
                            },
                            success: function(data){}
                        });
                        break;
                    case 'reset_sub':
                        $.ajax({
                            type: "PUT",
                            url: "/{$config['website_admin_path']}/user/update/status/reset_sub",
                            dataType: "JSON",
                            data:{
                                id
                            },
                            success: function(data) {
                                getResult('Thành công', '', 'success');
                                
                            }
                        });
                }
            }
        </script>
        <script>
            function zeroCreateUser() {
                $.ajax({
                    type: "POST",
                    url: "/{$config['website_admin_path']}/user/create",
                    dataType: "JSON",
                    data: {
                        email: $('#zero_create_user_email').val(),
                        passwd: $('#zero_create_user_passwd').val()
                    },
                    success: function (data) {
                        if (data.ret === 1) {
                            table_1.ajax.reload();
                            $("#zero_modal_create_user").modal('hide');
                            getResult(data.msg, '', 'success');
                        } else {
                            getResult('Đã xảy ra lỗi', '', 'error');
                        }
                    }
                });
            }
        </script>
        <script>
            function zeroModalAdminCreateOrderForUser(id) {
                $('#zero_create_order_user_id').val(id);
                $('#zero_modal_create_order_for_user').modal('show');
            }
        </script>
        <script>
        function zeroCreateOrderForUser() {
            $.ajax({
                type: "POST",
                url: "/{$config['website_admin_path']}/order/create",
                dataType: "JSON",
                data: {
                    id: $('#zero_create_order_user_id').val(),
                    product_id: $('#zero_create_order_product_id').val(),
                    product_period: $('#zero_create_order_product_period').val(),
                    order_total: $('#zero_create_order_total').val()
                },
                success: function (data) {
                    if (data.ret === 1) {
                        $("#zero_modal_create_order_for_user").modal('hide');
                        getResult(data.msg, '', 'success');
                    } else {
                        getResult(data.msg, '', 'error');
                    }
                }
            });
        }
    </script>
        <script>
            const filterSearch = document.querySelector('[data-kt-admin-table-filter="search"]');
            filterSearch.addEventListener('keyup', function (e) {
                table_1.search(e.target.value).draw();
            });
        </script>
    </body>
</html>