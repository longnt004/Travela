<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="statusPaymentModal" tabindex="-1"
	role="dialog" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered modal-sm"
		role="document">
		<div class="modal-content">
			<div class="modal-body text-center p-lg-4">
				<h4 class="text-info mb-3">Payment Method</h4>
				<div class="row">
					<div class="col-lg-6">
						<a id="paymentVNPay" class="btn btn btn-outline-primary w-100">VNPAY</a>
					</div>
					<div class="col-lg-6">
						<a onclick="booking(false)" class="btn btn btn-outline-success w-100" data-bs-dismiss="modal">Cash</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>