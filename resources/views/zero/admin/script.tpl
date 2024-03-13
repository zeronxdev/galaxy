<script src="/theme/galaxy/plugins/global/plugins.bundle.js"></script>
<script src="/theme/galaxy/js/scripts.bundle.js"></script>
<script src="/theme/galaxy/plugins/custom/datatables/datatables.bundle.js"></script>
<script>
    // get result 
function getResult(titles, texts, icons) {
    Swal.fire({
        title: titles,
        text: texts,
        icon: icons,
        buttonsStyling: false,
        confirmButtonText: "OK",
        customClass: {
            confirmButton: "btn btn-primary"
        }
    });
}

function getwarning() {
  return new Promise(function (resolve, reject) {
    Swal.fire({
      text: 'Xác nhận thao tác',
      icon: "warning",
      buttonsStyling: false,
      showCancelButton: true,
      confirmButtonText: "Xác nhận",
      cancelButtonText: "Hủy bỏ",
      customClass: {
        confirmButton: "btn btn-primary",
        cancelButton: "btn btn-light"
      }
    }).then(function (result) {
      if (result.isConfirmed) {
        resolve(); // 点击确定时返回一个已解决的 Promise 对象
      } else {
        reject(); // 点击取消时返回一个已拒绝的 Promise 对象
      }
    });
  });
}

$(document).ready(function (){
    // 获取当前 URL 路径
    var path = window.location.pathname;

    // 使用 split() 切割路径字符串
    var parts = path.split('/');

    // 访问最后一个元素
    var target2 = parts[2];
    var target1 = parts[1];
    $("a.menu-link[href='/"+target1+"/"+target2+"']").addClass('active');
});

//clipboard
var clipboard = new ClipboardJS('.copy-text');
clipboard.on('success', function(e) {
    getResult("Sao chép thành công", "", "success");
});
</script>
<script>
    function zeroAdminDelete(type, id){
        getwarning().then(function() {
            $.ajax({
                type: "DELETE",
                url: "/{$config['website_admin_path']}/"+type+"/delete",
                dataType: "json",
                data: {
                    id
                },
                success: function(data){
                    if (data.ret === 1){
                        getResult(data.msg, '', 'success');
                        table_1.ajax.reload();
                    }else{
                        getResult('Đã xảy ra lỗi', '', 'error');
                    }
                }
            });
        }).catch(function() {
            Swal.close();
        })
    }
</script>