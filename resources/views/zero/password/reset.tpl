<!DOCTYPE html>
<html lang="vi">
	<head>
		<title>{$config['website_name']} - Quên mật khẩu</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
		<link href="/favicon.png" rel="shortcut icon">
		<link href="/theme/galaxy/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="/theme/galaxy/css/style.bundle.css" rel="stylesheet" type="text/css" />
	</head>
	<body id="kt_body" class="app-blank app-blank bgi-size-cover bgi-position-center bgi-no-repeat">
		<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>

		<div class="d-flex flex-column flex-root" id="kt_app_root">
	<style>body { background-image: url({if (is_null($config['website_auth_background_image']))}'/theme/galaxy/media/auth/bg4.jpg'{else}{$config['website_auth_background_image']}{/if}); } [data-bs-theme="dark"] body { background-image: url({if (is_null($config['website_auth_background_image']))}'/theme/galaxy/media/auth/bg4-dark.jpg'{else}{$config['website_auth_background_image']}{/if}); }</style>
			<div class="d-flex flex-column flex-column-fluid flex-lg-row">
				<div class="d-flex flex-center w-lg-50 pt-15 pt-lg-0 px-10">
					<div class="d-flex flex-center flex-lg-start flex-column">
						<a href="#" class="mb-7 fs-3hx fw-bold text-white">{$config['website_name']}</a>						
					</div>
				</div>
				<div class="d-flex flex-center w-lg-50 p-10">
					<div class="card rounded-3 w-md-550px">
						<div class="card-body p-10 p-lg-20">
							<form class="form w-100" novalidate="novalidate" id="kt_password_reset_form" action="#">
								<div class="text-center mb-11">
										<h1 class="text-dark fw-bolder mb-3">Đặt lại mật khẩu</h1>
                                        <div class="text-gray-500 fw-semibold fs-6">Nhập email để đặt lại mật khẩu</div>
								</div>
								<div class="fv-row mb-10">
									<input class="form-control form-control-lg bg-transparent" type="text" placeholder="Email" name="email" id="email" autocomplete="off"/>									
								</div>

								<div class="d-flex flex-warp justify-content-center pb-lg-0">
									<button id="kt_password_reset_submit" class="btn btn-primary">
										<span class="indicator-label" data-kt-translate="sign-up-submit">Xác nhận</span>
                                        <span class="indicator-progress">
                                            <span data-kt-translate="general-progress">Vui lòng chờ</span>
                                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                        </span>
									</button>
                                    <a href="/auth/signin" class="btn btn-light">Hủy</a>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="app_footer py-4 d-flex flex-lg-column" id="kt_app_footer">
				<div class="app-container container-fluid d-flex flex-column flex-center py-3">
					<div class="text-white order-2 order-md-1 text-center">
						&copy;<script>document.write(new Date().getFullYear());</script>,&nbsp;<span>Bản quyền thuộc về&nbsp;{$config["website_name"]}</span><a class="text-white" href="https://github.com/zeropanel/zeropanel">&nbsp;Powered By ZeroBoard</a>
					</div>
				</div>
			</div>
		</div>
		<script src="/theme/galaxy/plugins/global/plugins.bundle.js"></script>
		<script src="/theme/galaxy/js/scripts.bundle.js"></script>
		<script src="/js/reset-password.js"></script>		
	</body>
</html>