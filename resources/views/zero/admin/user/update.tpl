<!DOCTYPE html>
<html lang="vi">

<head>
    <title>{$config["website_name"]}</title>

    <meta charset="UTF-8" />
    <meta name="renderer" content="webkit" />
    <meta name="description" content="Updates and statistics" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

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
                        <div class="card-title text-dark fs-3 fw-bolder">Thông tin người dùng</div>
                        <div class="card-toolbar">
                            <a class="btn btn-primary btn-sm fw-bold" onclick="updateUser('{$edit_user->id}')">Lưu thay
                                đổi</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-xxl-6">
                                <label class="form-label required" for="email">Email người dùng</label>
                                <input class="form-control mb-5" id="email" name="email" type="text"
                                    placeholder="Email người dùng" value="{$edit_user->email}">
                                <label class="form-label required" for="remark">Nhận xét</label>
                                <input class="form-control mb-5" id="remark" name="remark" type="text"
                                    placeholder="Nhận xét" value="{$edit_user->remark}">
                                <label class="form-label required" for="password">Mật khẩu</label>
                                <input class="form-control mb-5" id="password" name="password" type="password"
                                    placeholder="Để trống nếu không sửa đổi" value="" autocomplete="new-password">
                                <label class="form-label required" for="money">Số dư</label>
                                <input class="form-control mb-5" id="money" name="money" type="number"
                                    placeholder="Số dư người dùng" value="{$edit_user->money}">
                                <label class="form-label required" for="commission">Hoa hồng</label>
                                <input class="form-control mb-5" id="commission" name="commission" type="number"
                                    placeholder="Hoa hồng người dùng" value="{$edit_user->commission}">
                                <label class="form-label required" for="ban_time">Thời gian cấm thủ công</label>
                                <div class="input-group mb-5">
                                    <input class="form-control" id="ban_time" name="ban_time" type="number"
                                        placeholder="Thời gian cấm thủ công" value="0">
                                    <span class="input-group-text">Phút</span>
                                </div>
                                <label class="form-label required" for="last_detect_ban_time">Lần cấm cuối cùng</label>
                                <input class="form-control mb-5" id="last_detect_ban_time" name="last_detect_ban_time"
                                    type="text" disabled value="{$edit_user->last_detect_ban_time()}">
                                <label class="form-label required" for="unban_time">Thời gian mở khóa</label>
                                <input class="form-control mb-5" id="unban_time" name="unban_time" type="text" disabled
                                    value="{$edit_user->relieve_time()}">
                                <label class="form-label required" for="detect_ban_number">Tổng số lần cấm</label>
                                <input class="form-control mb-5" id="detect_ban_number" name="detect_ban_number"
                                    type="text" disabled
                                    value="{if $edit_user->detect_ban_number()==0}Chưa từng bị cấm{else}Đã bị cấm {$edit_user->detect_ban_number()} lần{/if}"">
                                <label class=" form-label required" for="all_detect_number">Tổng số vi phạm</label>
                                <input class="form-control mb-5" id="all_detect_number" name="all_detect_number"
                                    type="text" disabled value="{$edit_user->all_detect_number}">
                                <label class="form-label required" for="withdraw_account">Tài khoản rút tiền</label>
                                <input class="form-control mb-5" id="withdraw_account" name="withdraw_account"
                                    type="text" disabled value="{$edit_user->withdraw_account}">
                            </div>
                            <div class="col-xxl-6">
                                <label class="form-label required" for="passwd">Mật khẩu ShadowSocks</label>
                                <input class="form-control mb-5" id="passwd" name="passwd" type="text" disabled
                                    value="{$edit_user->passwd}">
                                <label class="form-label required" for="uuid">UUID VMESS/TROJAN</label>
                                <input class="form-control mb-5" id="uuid" name="uuid" type="text" disabled
                                    value="{$edit_user->uuid}">
                                <label class="form-label required" for="transfer_enable">Lưu lượng có thể dùng</label>
                                <input class="form-control mb-5" id="transfer_enable" name="transfer_enable" type="text"
                                    value="{$edit_user->enableTrafficInGB()}">
                                <label class="form-label required" for="usedTraffic">Lưu lượng đã sử dụng</label>
                                <input class="form-control mb-5" id="usedTraffic" name="usedTraffic" type="text"
                                    disabled value="{$edit_user->usedTraffic()}">
                                <label class="form-label required" for="ref_by">ID người mời</label>
                                <input class="form-control mb-5" id="ref_by" name="ref_by" type="number" disabled
                                    value="{$edit_user->ref_by}">
                                <label class="form-label required" for="group">Nhóm người dùng</label>
                                <input class="form-control mb-5" id="group" name="group" type="number"
                                    value="{$edit_user->node_group}">

                                <label class="form-label required" for="product_id">ID Gói dịch vụ</label>
                                <input class="form-control mb-5" id="product_id" name="product_id" type="number"
                                    value="{$edit_user->product_id}">

                                <label class="form-label required" for="class">Cấp độ người dùng</label>
                                <input class="form-control mb-5" id="class" name="class" type="number"
                                    value="{$edit_user->class}">
                                <label class="form-label required" for="class_expire">Hạn sử dụng</label>
                                <input class="form-control mb-5" id="class_expire" name="class_expire" type="text"
                                    value="{$edit_user->class_expire}">
                                <label class="form-label required" for="node_speedlimit">Tốc độ giới hạn</label>
                                <div class="input-group mb-5">
                                    <input class="form-control" data-bs-toggle="tooltip" title="0 Nghĩa là không có giới hạn"
                                        id="node_speedlimit" name="node_speedlimit" type="text"
                                        value="{$edit_user->node_speedlimit}">
                                    <span class="input-group-text">Mbps</span>
                                </div>
                                <label class="form-label required" for="node_iplimit">Giới hạn thiết bị</label>
                                <div class="input-group mb-5">
                                    <input class="form-control" data-bs-toggle="tooltip" title="0 Nghĩa là không có giới hạn" id="node_iplimit"
                                        name="node_iplimit" type="text" value="{$edit_user->node_iplimit}">
                                    <span class="input-group-text">IP</span>
                                </div>
                            </div>
                        </div>
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
    function updateUser(id) {
        $.ajax({
            type: "PUT",
            url: "/{$config['website_admin_path']}/user/update",
            dataType: "JSON",
            data: {
                id,
                email: $('#email').val(),
                password: $('#password').val(),
                group: $('#group').val(),
                transfer_enable: $('#transfer_enable').val(),
                node_speedlimit: $('#node_speedlimit').val(),
                remark: $('#remark').val(),
                money: $('#money').val(),
                commission: $('#commission').val(),
                ban_time: $('#ban_time').val(),
                class: $('#class').val(),
                class_expire: $('#class_expire').val(),
                node_iplimit: $('#node_iplimit').val(),
                product_id: $('#product_id').val(),
            },
            success: function(data) {
                if (data.ret === 1) {
                    Swal.fire({
                        text: data.msg,
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    }).then(function(result) {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                } else {
                    getResult(data.msg, '', 'error');
                }
            }
        })
    }
</script>
</body>

</html>