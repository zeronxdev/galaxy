<!DOCTYPE html>
<html lang="vi">

<head>
	<title>{$config["website_name"]} Product</title>

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
</head>
{include file ='include/index/menu.tpl'}
<div class="app-main flex-column flex-row-fluid" id="kt_app_main">
	<div class="d-flex flex-column flex-column-fluid mt-10">
		<div id="kt_app_content" class="app-content flex-column-fluid">
			<div id="kt_app_content_container" class="app-container container-xxl">
				<div class="card" id="kt_pricing">
					<div class="card-body p-lg-17">
						<div class="d-flex flex-column">
							<div class="mb-13 text-center">
								<h1 class="fs-2hx fw-bold mb-5">Lựa chọn gói dịch vụ</h1>
								<div class="text-gray-400 fw-semibold fs-5"></div>
							</div>
							<div class="nav-group nav-group-outline mx-auto mb-15 nav" data-kt-buttons="true">
								{foreach $product_tab_lists as $product_tab}
									<button
										class="btn btn-color-gray-400 btn-active btn-active-secondary px-6 py-3 me-2 {if $product_tab['type'] == 1} active{/if}"
										data-bs-toggle="tab"
										data-bs-target="#product_tab_type_{$product_tab['type']}">{$product_tab['name']}</button>
								{/foreach}
							</div>
							<div class="tab-content">
								{foreach $product_lists as $key => $value}
									<div class="tab-pane fade show {if $key == 1} active{/if}" id="product_tab_type_{$key}">
										<div class="row g-10">
											{if $count[$key] != '0'}
												{foreach $products as $product}
													{if $product->type == $key}
														<div class="col-xl-4">
															<div class="d-flex h-100 align-items-center">
																<div
																	class="w-100 d-flex flex-column flex-center rounded-3 bg-light bg-opacity-75 py-15 px-10">
																	<div class="mb-7 text-center">
																		<h1 class="text-dark mb-5 fw-bolder"
																			id="zero_product_name_{$product->id}">{$product->name}</h1>
																		<div class="text-center">
																			<span
																				class="mb-2 text-primary fw-bold">{$currency_unit}</span>
																			<span class="fs-3x fw-bold text-primary"
																				id="zero_product_price_{$product->id}">
																				{if $product->type == 1}
																					{if $product->two_year_price != NULL}
																						{number_format($product->two_year_price, 0, '.', '')}
																					{else if $product->type == 1}	
																						{number_format($product->month_price, 0, '.', '')}			
																					{/if}	
																				{/if}
																				{if $product->type != 1}
																					{$product->onetime_price}
																				{/if}	
																			</span>
																			{if $product->type == 1}
																				{if $product->two_year_price == NULL}
																					<br><span class="fs-7 fw-semibold opacity-50">
																						<span data-kt-element="period">Tháng</span></span>
																				{else}
																					<br><span class="fs-7 fw-semibold opacity-50">
																						<span data-kt-element="period">Vĩnh Viễn</span></span>
																				{/if}
																			{/if}
																			{if $product->type == 3}
																				<span class="fs-7 fw-semibold opacity-50">/
																					<span data-kt-element="period">Dài hạn</span></span>
																			{/if}
																		</div>
																	</div>
																	<div class="w-100 mb-10" id="zero_product_{$product->id}">
																		{if is_null($product->custom_content)}
																			{if $product->type == 2}
																				<div class="d-flex align-items-center mb-5">
																					<span
																						class="fw-semibold fs-6 text-gray-800 flex-grow-1 pe-3">Lưu
																						lượng:</span> <span
																						class="badge badge-success fw-bold fs-6">{$product->traffic}GB</span>
																					<span class="svg-icon svg-icon-1 svg-icon-success">
																						<svg width="24" height="24" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<rect opacity="0.3" x="2" y="2" width="20"
																								height="20" rx="10" fill="currentColor" />
																							<path
																								d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
																								fill="currentColor" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span class="fw-semibold fs-6 text-gray-800 flex-grow-1">Mua
																						thêm lưu lượng cho gói hiện tại</span>
																					<span class="svg-icon svg-icon-1 svg-icon-warning">
																						<svg xmlns="http://www.w3.org/2000/svg" width="16"
																							height="16" fill="currentColor" class="bi bi-bell"
																							viewBox="0 0 16 16">
																							<path
																								d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span class="fw-semibold fs-6 text-gray-800 flex-grow-1">Chỉ
																						mua nếu đã có gói sẵn</span>
																					<span class="svg-icon svg-icon-1 svg-icon-warning">
																						<svg width="16" height="16" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<path
																								d="M11.9626 4.00678C12.231 3.99278 12.4815 4.13007 12.6157 4.36567C12.6163 4.36567 12.6168 4.36567 12.6174 4.36567L20.9173 18.9131C21.2029 19.4142 20.8717 19.9932 20.2999 19.9932H3.7002C3.12849 19.9932 2.79723 19.4142 3.08287 18.9131L11.3827 4.36567C11.3833 4.36567 11.3838 4.36567 11.3844 4.36567C11.5052 4.15367 11.721 4.01968 11.9626 4.00678H11.9626Z"
																								stroke="#ffc700" stroke-linecap="square"
																								stroke-linejoin="round" stroke-width="2" />
																							<path
																								d="M12 18C12.5523 18 13 17.5523 13 17C13 16.4477 12.5523 16 12 16C11.4477 16 11 16.4477 11 17C11 17.5523 11.4477 18 12 18Z"
																								fill="#ffc700" />
																							<path d="M12 15V8" stroke="#ffc700"
																								stroke-width="2" />
																						</svg>
																					</span>
																				</div>
																			{else}
																				<div class="d-flex align-items-center mb-5">
																					<span
																						class="fw-semibold fs-6 text-gray-800 flex-grow-1 pe-3">Lưu
																						lượng:</span> <span
																						class="badge badge-success fw-bold fs-6">{$product->traffic}GB</span>
																					<span class="svg-icon svg-icon-1 svg-icon-success">
																						<svg width="24" height="24" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<rect opacity="0.3" x="2" y="2" width="20"
																								height="20" rx="10" fill="currentColor" />
																							<path
																								d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
																								fill="currentColor" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span
																						class="fw-semibold fs-6 text-gray-800 flex-grow-1 pe-3">Giới
																						hạn thiết bị</span><span
																						class="badge badge-success fw-bold fs-6">{if empty($product->ip_limit)}Không
																						giới hạn{else}{$product->ip_limit}&nbsp;Thiết
																						bị{/if}</span>
																					<span class="svg-icon svg-icon-1 svg-icon-success">
																						<svg width="24" height="24" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<rect opacity="0.3" x="2" y="2" width="20"
																								height="20" rx="10" fill="currentColor" />
																							<path
																								d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
																								fill="currentColor" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span
																						class="fw-semibold fs-6 text-gray-800 flex-grow-1 pe-3">Tốc
																						độ tối đa: </span>{if empty($product->speed_limit)}<span
																							class="badge badge-success fw-bold fs-6">Không giới
																						hạn</span>{else}{$product->speed_limit}
																					Mbps{/if}&nbsp;</span>
																					<span class="svg-icon svg-icon-1 svg-icon-success">
																						<svg width="24" height="24" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<rect opacity="0.3" x="2" y="2" width="20"
																								height="20" rx="10" fill="currentColor" />
																							<path
																								d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
																								fill="currentColor" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span
																						class="fw-semibold fs-6 text-gray-800 flex-grow-1 pe-3">Quy
																						tắc hạn chế:</span><span
																						class="badge badge-success fw-bold fs-6">Không&nbsp;</span>
																					<span class="svg-icon svg-icon-1 svg-icon-success">
																						<svg width="24" height="24" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<rect opacity="0.3" x="2" y="2" width="20"
																								height="20" rx="10" fill="currentColor" />
																							<path
																								d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
																								fill="currentColor" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span
																						class="fw-semibold fs-6 text-gray-800 flex-grow-1 pe-3">Quyền
																						truy cập:</span><span
																						class="badge badge-success fw-bold fs-6">{$user->getPermission($product->class)}&nbsp;</span>
																					<span class="svg-icon svg-icon-1 svg-icon-success">
																						<svg width="24" height="24" viewBox="0 0 24 24"
																							fill="none" xmlns="http://www.w3.org/2000/svg">
																							<rect opacity="0.3" x="2" y="2" width="20"
																								height="20" rx="10" fill="currentColor" />
																							<path
																								d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
																								fill="currentColor" />
																						</svg>
																					</span>
																				</div>
																				<div class="d-flex align-items-center mb-5">
																					<span class="fw-semibold fs-6 text-gray-800 flex-grow-1">Có
																						thể sử dụng máy chủ ≤
																						{$user->getPermission($product->class)}</span>
																					<span class="svg-icon svg-icon-1 svg-icon-warning">
																						<svg xmlns="http://www.w3.org/2000/svg" width="16"
																							height="16" fill="currentColor" class="bi bi-bell"
																							viewBox="0 0 16 16">
																							<path
																								d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
																						</svg>
																					</span>
																				</div>
																			{/if}
																		{else}
																			{$product->custom_content}
																		{/if}
																	</div>
																	{if $product->stock > 0 && $product->stock - $product->realTimeSales() <= 0}
																		<button class="btn btn-sm fw-bold btn-primary" disabled>Đã hết
																			hàng</button>
																	{else}
																		<button class="btn btn-sm fw-bold btn-primary" type="submit"
																			data-kt-users-action="check-out-{$product->id}"
																			data-bs-toggle="modal"
																			onclick="kTUserConfigureProductModal({$product->id})">
																			<span class="indicator-label">Mua gói</span>
																			<span class="indicator-progress">Vui lòng chờ
																				<span
																					class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
																		</button>

																	{/if}
																</div>
															</div>
														</div>
													{/if}
												{/foreach}
											{/if}
										</div>
									</div>
								{/foreach}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="app_footer py-4 d-flex flex-lg-column" id="kt_app_footer">
		<div class="app-container container-fluid d-flex flex-column flex-md-row flex-center flex-md-stack py-3">
			<div class="text-dark-75 order-2 order-md-1">
				&copy;<script>
					document.write(new Date().getFullYear());
				</script>&nbsp;<a>Bản quyền thuộc về&nbsp;{$config["website_name"]}</a>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>

<div class="modal fade" id="zero_modal_configure_product" data-bs-backdrop="static" data-bs-keyboard="false"
	tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content rounded">
			<div class="modal-header justify-content-end border-0 pb-0">
				<div class="btn btn-sm btn-icon btn-active-color-primary" data-bs-dismiss="modal">
					<span class="svg-icon svg-icon-1">
						<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1"
								transform="rotate(-45 6 17.3137)" fill="currentColor" />
							<rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)"
								fill="currentColor" />
						</svg>
					</span>
				</div>
			</div>
			<div class="modal-body pt-0 pb-15 px-5 px-xl-20">
				<div class="mb-13 text-center">
					<h1 class="mb-3">Chi tiết gói dịch vụ</h1>
				</div>
				<div class="d-flex flex-column">
					<div class="row mt-10 g-5">
						<div class="col-lg-7">
							<div class="tab-content rounded h-100 bg-light p-10">
								<div class="tab-pane fade show active">
									<div class="pb-5">
										<h2 class="fw-bold text-dark">Gói này báo gồm:</h2>
										<!--<div class="text-muted fw-semibold">for light users</div>-->
									</div>
									<div class="w-100 mb-10" id="zero_modal_configure_product_inner_html">
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-5">
							<div class="card card-dashed mb-5" id="zero_modal_configure_coupon_html">
								<div class="card-body">
									<div class="d-flex align-items-center">
										<input class="form-control me-3" placeholder="Mã giảm giá" type="text"
											id="zero_coupon_code">
										<button id="zero_modal_configure_coupon" type="submit"
											data-kt-users-action="verify-coupon"
											class="btn btn-light fw-bold flex-shrink-0" onclick="KTUserVerifyCoupon()">
											<span class="indicator-label">Xác nhận</span>
											<span class="indicator-progress">Vui lòng chờ
												<span
													class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
										</button>
									</div>
								</div>
							</div>
							<div class="card card-dashed card-flush mb-5">
								<div class="card-body">
									<div class="d-flex align-items-center">
										<span class="fw-semibold text-gray-00 fs-4 flex-grow-1 pe-3"
											id="zero_modal_configure_product_name"></span>
										<span class="fw-semibold text-gray-800 fs-4"
											id="zero_modal_configure_product_price"></span>
									</div>
									<div class="separator my-10"></div>
									<div class="d-flex align-items-center">
										<span class="fw-semibold fs-4 flex-grow-1 pe-3">Tổng cộng</span>
										<span class="fw-bold fs-2" id="zero_modal_configure_product_total"></span>
									</div>
								</div>
							</div>
							<div class="card card-dashed card-flush">
								<div class="card-body">

									<ul class="nav nav-pills d-flex flex-column flex-sm-row justify-content-center"
										role="tablist">
										<li class="nav-item mb-3 d-flex flex-column"
											id="zero_modal_configure_product_month_price">

										</li>

										<li class="nav-item mb-3 d-flex flex-column"
											id="zero_modal_configure_product_quarter_price">

										</li>

										<li class="nav-item mb-3 d-flex flex-column"
											id="zero_modal_configure_product_half_year_price">

										</li>

										<li class="nav-item mb-3 d-flex flex-column"
											id="zero_modal_configure_product_year_price">

										</li>
										<li class="nav-item d-flex flex-column"
											id="zero_modal_configure_product_two_year_price">

										</li>
									</ul>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex flex-center flex-row-fluid pt-12">
					<button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Hủy</button>
					<button type="submit" class="btn btn-primary" data-kt-users-action="submit" onclick="">
						<span class="indicator-label">Xác nhận</span>
						<span class="indicator-progress">Vui lòng chờ
							<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
{include file='include/index/news.tpl'}
<script>
	var currency_unit = "{$currency_unit}";
</script>
{include file='include/global/scripts.tpl'}

<script>
	$("#zero_modal_configure_product").on('hidden.bs.modal', function() {
		$("#zero_modal_configure_product_month_price").html('');
		$("#zero_modal_configure_product_quarter_price").html('');
		$("#zero_modal_configure_product_half_year_price").html('');
		$("#zero_modal_configure_product_year_price").html('');
		$("#zero_modal_configure_product_two_year_price").html('');
		console.log('clean success');
	});
</script>
</body>

</html>