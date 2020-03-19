<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading">Enter OTP Received on provided contact</div>
				<div class="panel-body">
					<form:form method="post" modelAttribute="volunteerJobOtp">
						<form:hidden path="id" />
						<fieldset class="form-group">
							<form:label path="jobId">Job Id</form:label>
							<form:input path="jobId" type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="jobId" cssClass="text-warning" />
						</fieldset>
						
						
						<fieldset class="form-group">
							<form:label path="jobTittle">Job Tittle</form:label>
							<form:input path="jobTittle" type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="jobTittle" cssClass="text-warning" />
						</fieldset>
						
						
						<fieldset class="form-group">
							<form:label path="otp">OTP</form:label>
							<form:input path="otp" type="text" class="form-control"
								required="required" />
							<form:errors path="otp" cssClass="text-warning" />
						</fieldset>
												
						<button type="submit" class="btn btn-success">Save</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="common/footer.jspf"%>