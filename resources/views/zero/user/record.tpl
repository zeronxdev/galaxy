<!DOCTYPE html>
<html lang="vi">
    <head>
	<title>{$config["website_name"]} Record</title>
        
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
    {include file ='include/index/menu.tpl'}
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <div class="d-flex flex-column flex-column-fluid mt-10">
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <div id="kt_app_content_container" class="app-container container-xxl">
                                    <div class="card mb-9">
                                        <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                                            <div class="card-title">
                                                <div class="fs-3 fw-bolder text-dark">
												Nhật ký đăng nhập
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body pt-0">
                                            
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_signin_log_table">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                        
                                                        <th>IP</th>
                                                        <th>Địa chỉ</th>
                                                        <th>Ngày</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card mb-9">
                                        <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                                            <div class="card-title">
                                                <div class="fs-3 fw-bolder text-dark">
												Nhật ký sử dụng
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body pt-0">
                                            
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_used_log_table">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                                        
                                                        <th>IP</th>
                                                        <th>Địa chỉ</th>
                                                        <th>Ngày</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card mb-9">
                                        <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                                            <div class="card-title">
                                                <div class="fs-3 fw-bolder text-dark">
                                                    Nhật ký đồng bộ
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body pt-0">
                                            
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_subscribe_log_table">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">  
                                                        <th>IP</th>
                                                        <th>Địa chỉ</th>
                                                        <th>Ngày</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="card mb-9">
                                        <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                                            <div class="card-title">
                                                <div class="fs-3 fw-bolder text-dark">
                                                    Sử dụng lưu lượng
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body pt-0">
                                            
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_traffic_log_table">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">                                                       
                                                        <th>Máy chủ</th>
                                                        <th>Lưu lượng</th>
                                                        <th>Ngày</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="app_footer py-4 d-flex flex-lg-column" id="kt_app_footer">
                            <div class="app-container container-fluid d-flex flex-column flex-md-row flex-center flex-md-stack py-3">
                                <div class="text-dark-75 order-2 order-md-1">
                                    &copy;<script>document.write(new Date().getFullYear());</script>&nbsp;<a>Bản quyền thuộc về&nbsp;{$config["website_name"]}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		{include file='include/global/scripts.tpl'}
        {include file='include/index/news.tpl'}
    </body>
</html>