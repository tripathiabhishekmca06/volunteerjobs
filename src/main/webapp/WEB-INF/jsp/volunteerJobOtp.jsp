<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading" id="otp_header">Enter OTP Received on provided contact</div>
				<div class="panel-body">
					<form:form method="post" modelAttribute="volunteerJobOtp" id="myForm">
						<form:hidden path="id" id="obj_id"/>
						<form:hidden path="otpSend" id="obj_otpSend"/>

						<form:hidden path="otpRetryCount" id="otpRetryCount"/>
						
						<form:hidden path="maskedMobileForOtp" id="maskedMobileForOtp"/>

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
					<!-- 	<button type="submit" class="btn btn-success" id="submitBttonId">Save</button>
					 -->	<a type="button" class="btn btn-success" id="submitBttonId" onclick="handleForm()">Submit</a>

<a type="button" href="/covid19/volunteerJobs" id="redirectBttonId" ></a>
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



function handleForm() {

	if(document.getElementById("obj_otpSend").value=="1" || document.getElementById("submitBttonId").innerHTML=="View All Openings"){
		
		document.getElementById('redirectBttonId').click();
	}else
		{
		document.getElementById('myForm').submit();
		}
	
	
	}
 window.onload = function() {
	 
	if(document.getElementById("obj_otpSend").value=="1"){
	document.getElementById("otp_header").innerHTML="Job is posted successfully and has been sent for verification. <br /> You may receive a call on " +document.getElementById("maskedMobileForOtp").value +". You may contact ******* for any issue";
	document.getElementById("otpId").disabled=true;
	
	document.getElementById("form_otp").classList.add("v_dispNone");
	document.getElementsByClassName("otpStaticInformation")[0].classList.add("v_dispNone");

	document.getElementById("form_otp").setAttribute("display","hidden");
	document.getElementById("submitBttonId").innerHTML="View All Openings";
	
	}
	else
		{
		document.getElementById("otp_header").innerHTML="Enter OTP Received on "+document.getElementById("maskedMobileForOtp").value;	
		if(document.getElementById("otpRetryCount").value=="1"){
			document.getElementById("otp_header").innerHTML=document.getElementById("otp_header").innerHTML+" (First OTP verfication attempt failed)";
		}
		
		if(document.getElementById("otpRetryCount").value=="2"){
			document.getElementById("otp_header").innerHTML=document.getElementById("otp_header").innerHTML+" (Second OTP verfication attempt failed)";
		}
		
	
		 if(document.getElementById("otpRetryCount").value!="2" && document.getElementById("otpRetryCount").value!="1" && document.getElementById("otpRetryCount").value!="0"){
		
			 document.getElementById("otp_header").innerHTML="No More OTP Verification Attempts";
				document.getElementById("otpId").disabled=true;
				document.getElementById("form_otp").classList.add("v_dispNone");
				document.getElementsByClassName("otpStaticInformation")[0].classList.add("v_dispNone");

				document.getElementById("form_otp").setAttribute("display","hidden");
				document.getElementById("submitBttonId").innerHTML="View All Openings";
		 
		 }
		
		
		
		}
	}; 
	
	
      </script>

<%@ include file="common/footer.jspf"%>