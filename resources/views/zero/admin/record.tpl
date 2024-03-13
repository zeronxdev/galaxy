<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>{$config["website_name"]} Nhật ký</title>
        
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
                                    <div class="card mb-5">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Người dùng trực tuyến</div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_admin_alive_record">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">                                                       
                                                        {foreach $table_config_alive['total_column'] as $key_alive => $value_alive}
                                                            <th class="{$key_alive}">{$value_alive}</th>
                                                        {/foreach}
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>  
                                    </div>
                                    <div class="card mb-5">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Nhật ký đồng bộ máy chủ</div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_admin_signin_record">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">                                                       
                                                        {foreach $table_config_signin['total_column'] as $key_signin => $value_signin}
                                                            <th class="{$key_signin}">{$value_signin}</th>
                                                        {/foreach}
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>  
                                    </div>
                                    <div class="card mb-5">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Lịch sử đồng bộ máy chủ</div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_admin_subscribe_record">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">                                                       
                                                        {foreach $table_config_subscribe['total_column'] as $key_subscribe => $value_subscribe}
                                                            <th class="{$key_subscribe}">{$value_subscribe}</th>
                                                        {/foreach}
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
                                        </div>  
                                    </div>
                                    <div class="card mb-5">
                                        <div class="card-header">
                                            <div class="card-title text-dark fs-3 fw-bolder">Nhật ký sử dụng</div>
                                        </div>
                                        <div class="card-body">
                                            <table class="table align-middle table-striped table-row-bordered text-nowrap gy-5 gs-7" id="zero_admin_traffic_record">
                                                <thead>
                                                    <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">                                                       
                                                        {foreach $table_config_traffic['total_column'] as $key_traffic => $value_traffic}
                                                            <th class="{$key_traffic}">{$value_traffic}</th>
                                                        {/foreach}
                                                    </tr>
                                                </thead>
                                                <tbody class="text-gray-600 fw-semibold"></tbody>
                                            </table>
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
        {include file='admin/script.tpl'}
        <script>
            KTAdminAliveRecord = $('#zero_admin_alive_record').DataTable({
            ajax: {
            url: '{$table_config_alive['ajax_url']}',
            type: "POST"
            },
            processing: true,
            serverSide: true,
            order: [[ 0, 'desc' ]],
            stateSave: true,
            columnDefs: [
                { className: 'text-end', targets: -1 },
                { orderable: false, targets: '_all' },
                { orderable: true, targets: 0}
            ],
            columns: [
            {foreach $table_config_alive['total_column'] as $key_alive => $value_alive}
                { "data": "{$key_alive}" },
            {/foreach}
            ],
            {include file='table/lang_chinese.tpl'}
            })
    
    
            var has_init = JSON.parse(localStorage.getItem(window.location.href + '-hasinit'));
        </script>
        <script>
            KTAdminSigninRecord = $('#zero_admin_signin_record').DataTable({
            ajax: {
            url: '{$table_config_signin['ajax_url']}',
            type: "POST"
            },
            processing: true,
            serverSide: true,
            order: [[ 0, 'desc' ]],
            stateSave: true,
            columnDefs: [
                { className: 'text-end', targets: -1 },
                { orderable: false, targets: '_all' },
                { orderable: true, targets: 0}
            ],
            columns: [
            {foreach $table_config_signin['total_column'] as $key_signin => $value_signin}
                { "data": "{$key_signin}" },
            {/foreach}
            ],
            {include file='table/lang_chinese.tpl'}
            })
    
    
            var has_init = JSON.parse(localStorage.getItem(window.location.href + '-hasinit'));
        </script>
        <script>
            KTAdminSubscribeRecord = $('#zero_admin_subscribe_record').DataTable({
            ajax: {
            url: '{$table_config_subscribe['ajax_url']}',
            type: "POST"
            },
            processing: true,
            serverSide: true,
            order: [[ 0, 'desc' ]],
            stateSave: true,
            columnDefs: [
                { className: 'text-end', targets: -1 },
                { orderable: false, targets: '_all' },
                { orderable: true, targets: 0}
            ],
            columns: [
            {foreach $table_config_subscribe['total_column'] as $key_subscribe => $value_subscribe}
                { "data": "{$key_subscribe}" },
            {/foreach}
            ],
            {include file='table/lang_chinese.tpl'}
            })
    
    
            var has_init = JSON.parse(localStorage.getItem(window.location.href + '-hasinit'));
        </script>
        <script>
            KTAdminTrafficRecord = $('#zero_admin_traffic_record').DataTable({
            ajax: {
            url: '{$table_config_traffic['ajax_url']}',
            type: "POST"
            },
            processing: true,
            serverSide: true,
            order: [[ 0, 'desc' ]],
            stateSave: true,
            columnDefs: [
                { className: 'text-end', targets: -1 },
                { orderable: false, targets: '_all' },
                { orderable: true, targets: 0}
            ],
            columns: [
            {foreach $table_config_traffic['total_column'] as $key_traffic => $value_traffic}
                { "data": "{$key_traffic}" },
            {/foreach}
            ],
            {include file='table/lang_chinese.tpl'}
            })
    
    
            var has_init = JSON.parse(localStorage.getItem(window.location.href + '-hasinit'));
        </script>
    </body>
</html>