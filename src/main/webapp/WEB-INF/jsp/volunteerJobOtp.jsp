<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading" id="otp_header">Enter OTP Received on provided contact</div>
				<div class="panel-body">
					<form:form method="post" modelAttribute="volunteerJobOtp">
						<form:hidden path="id" id="obj_id"/>
						<form:hidden path="otpSend" id="obj_otpSend"/>
						
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
						
						
						<fieldset class="form-group" id="form_otp">
							<form:label path="otp">OTP</form:label>
							<form:input path="otp" type="text" class="form-control"
								required="required" id="otpId"/>
							<form:errors path="otp" cssClass="text-warning" />
						</fieldset>
						<button type="submit" class="btn btn-success" id="submitBttonId">Save</button>
						
						<p class="otpStaticInformation">If you don't receive OTP Please contact to xxxxxxxxxx or xxxx@xxxx.com.</p>
						
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.otpStaticInformation {
		padding: 10px 0;
		color: #666;
	}
	
	
	.v_dispNone {
		display: none;
	}
</style>



<script>

 window.onload = function() {
	if(document.getElementById("obj_otpSend").value=="1"){
	document.getElementById("otp_header").innerHTML="OTP Verification was successfull";
	document.getElementById("otpId").disabled=true;
	
	document.getElementById("form_otp").classList.add("v_dispNone");
	document.getElementsByClassName("otpStaticInformation")[0].classList.add("v_dispNone");

	document.getElementById("form_otp").setAttribute("display","hidden");
	document.getElementById("submitBttonId").innerHTML="View All Openings";
	}
	}; 
      </script>

<%@ include file="common/footer.jspf"%>