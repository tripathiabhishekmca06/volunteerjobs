<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading" id="postJobTittle">Post Volunteer Opening for COVID-19</div>
				<div class="panel-body" id="jobPostForm">
					<form:form method="post" modelAttribute="volunteerJob">
						<form:hidden path="id" id="objectId"/>
						<form:hidden path="jobId"  id="hiddenJobId"/>
						
						<h4 class="mb_10">Requirement Posted By</h4>
						
						<fieldset class="form-group">
							<form:label path="postedBy" class="required">Name</form:label>
							<form:input path="postedBy" type="text" class="form-control"
								required="required" />
							<form:errors path="postedBy" cssClass="text-warning" />
						</fieldset>
						<fieldset class="form-group">
							<form:label path="selfOrganisation" class="required">Organisation</form:label>
							<form:input path="selfOrganisation" type="text" class="form-control"
								required="required" />
							<form:errors path="selfOrganisation" cssClass="text-warning" />
						</fieldset>
						
						<fieldset class="form-group">
							<form:label path="alternativePhoneNumber" class="required">Contact (For OTP Verification)</form:label>
							<form:input path="alternativePhoneNumber"  type="text" maxlength="12" class="form-control"
								required="required" />
							<form:errors path="alternativePhoneNumber" cssClass="text-warning" />
						</fieldset>
						
						
						
						
						
						<h4 class="mb_10 mt_50">About Volunteer Opening</h4>
						
						<fieldset class="form-group">
							<form:label path="jobTittle" class="required">Job Tittle</form:label>
							<form:input path="jobTittle" type="text" class="form-control"
								required="required" />
							<form:errors path="jobTittle" cssClass="text-warning" />
						</fieldset>
						
						<fieldset class="form-group">
							<form:label path="organisation" class="required">Organisation</form:label>
							<form:input path="organisation" type="text" class="form-control"
								required="required" />
							<form:errors path="organisation" cssClass="text-warning" />
						</fieldset>	
						<fieldset class="form-group">
							<form:label path="workArea" class="required">Location</form:label>
							<form:input path="workArea" type="text" class="form-control"
								required="required" />
							<form:errors path="workArea" cssClass="text-warning" />
						</fieldset>
						
						<fieldset class="form-group">
							<form:label path="jobDetails" class="required">Job Details</form:label>
							<form:input path="jobDetails" id="jobDetails"  class="form-control"
								required="required" type="hidden" />
								 <div id="editableJobDetails" contenteditable="true"></div> 
							<form:errors path="jobDetails" cssClass="text-warning" />
						</fieldset>
						<fieldset class="form-group">
							<form:label path="skills" class="required">Desired Skills/Qualification</form:label>
							 <form:input path="skills" id="skills" type="text" class="form-control"
								required="required" /> 
							<form:errors path="skills" cssClass="text-warning" />
						</fieldset>
						
						
						<fieldset class="form-group">
							<form:label path="Timming">Timing</form:label>
							<form:input path="Timming" type="text" class="form-control"
								 />
							<form:errors path="Timming" cssClass="text-warning" />
						</fieldset>
						
						<fieldset class="form-group">
							<form:label path="primaryPhoneNumber" class="required">Contact (Visible to JobSeeker)</form:label>
							<form:input path="primaryPhoneNumber" type="text" maxlength="12" class="form-control"
								required="required" />
							<form:errors path="primaryPhoneNumber" cssClass="text-warning" />
						</fieldset>
						
						<fieldset class="form-group">
							<form:label path="email" class="required">Email</form:label>
							<form:input path="email" type="text" class="form-control"
							required="required" />
							<form:errors path="email" cssClass="text-warning" />
						</fieldset>
						
						
					
						
						

						

					<%-- 	<fieldset class="form-group">
							<form:label path="liveDate">Live Date</form:label>
							<form:input path="liveDate"  class="form-control"
								required="required" />
							<form:errors path="liveDate" cssClass="text-warning" />
						</fieldset>
<fieldset class="form-group">
							<form:label path="expiryDate">expiryDate</form:label>
							<form:input path="expiryDate" type="text" class="form-control"
								 />
							<form:errors path="expiryDate" cssClass="text-warning" />
						</fieldset> --%>
						<button type="submit" id="submitBttn" class="btn btn-success" disabled="true">Save With OTP Verification</button>
						<form:checkbox path="acceptTerm" id="acceptTerm" onclick="acceptTermFunction()"/>  
					<a href="https://www.naukri.com/termsconditions" target="_blank">Accept Naukri Terms and Conditions </a>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
document.getElementById("editableJobDetails").innerHTML = document.getElementById("jobDetails").value; 
</script>
<script type="text/javascript">
document.getElementById("editableJobDetails").addEventListener("input",
		function() {
	     var editableContent = document.getElementById("editableJobDetails").innerHTML;
	     document.getElementById("jobDetails").value = editableContent;
	}, false);
	
	
	
	
document.getElementById("alternativePhoneNumber").addEventListener("input",
		function() {
	     var editableContactContent = document.getElementById("alternativePhoneNumber").value;
	     document.getElementById("primaryPhoneNumber").value = editableContactContent;
	}, false);
	
function acceptTermFunction() {
	  var checkBox = document.getElementById("acceptTerm");
	  if (checkBox.checked == true){
		  document.getElementById("submitBttn").disabled = false;

	  } else {
		  document.getElementById("submitBttn").disabled = true;

	  }
	}
	
window.onload = function() {
	
	 var checkBox = document.getElementById("acceptTerm");
	  if (checkBox.checked == true){
		  document.getElementById("submitBttn").disabled = false;

	  } else {
		  document.getElementById("submitBttn").disabled = true;

	  }
	  
	  
	if(document.getElementById("hiddenJobId").value!="")
	document.getElementById("postJobTittle").innerHTML="Update Posted Job :"+document.getElementById("hiddenJobId").value;
	};
</script>

<style>
#editableJobDetails {

min-height: 100px;
padding: 6px 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    color: #555;
    font-size: 14px;
}

#editableJobDetails:focus, #editableJobDetails:active {
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
}

#jobPostForm label {
	font-weight: 400;
}

.mb_10 {
	margin-bottom: 10px;
}

.mt_50 {
	margin-top: 50px;
}

#jobPostForm label.required::after {
    content: "*";
    color: red;
    margin-left: 5px;
   }




</style>
<%@ include file="common/footer.jspf"%>