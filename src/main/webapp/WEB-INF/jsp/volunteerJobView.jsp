<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<div class="container">
	<div class="row" style="width: 1170px;">
		<div class="col-md-6 col-md-offset-3 ">
			<div class="panel panel-primary">
				<div class="panel-heading" id="pageTiteTxt">Volunteer Job</div>
				<div class="panel-body">
					<form:form method="post" modelAttribute="volunteerJob">
						<form:hidden path="id"  id="hiddenJobId"/>
							<fieldset class="form-group">
							<form:label path="jobTittle">Job Tittle</form:label>
							<form:input path="jobTittle" id="id_jobTittle"  type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="jobTittle" cssClass="text-warning" />
						</fieldset>
						
						
						<fieldset class="form-group">
							<form:label path="primaryPhoneNumber">Contact</form:label>
							<form:input path="primaryPhoneNumber" type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="primaryPhoneNumber" cssClass="text-warning" />
						</fieldset>
						<fieldset class="form-group">
							<form:label path="email">Email</form:label>
							<form:input path="email" type="text" class="form-control"
								 readonly="readonly" disabled="true"/>
							<form:errors path="email" cssClass="text-warning" />
						</fieldset>
						
						
						
						<fieldset class="form-group">
							<form:label path="organisation">Organisation</form:label>
							<form:input path="organisation" type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="organisation" cssClass="text-warning" />
						</fieldset>	
						<fieldset class="form-group">
							<form:label path="workArea">Location</form:label>
							<form:input path="workArea" type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="workArea" cssClass="text-warning" />
						</fieldset>
						<fieldset class="form-group">
							<form:label path="Timming">Timming</form:label>
							<form:input path="Timming" type="text" class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="Timming" cssClass="text-warning" />
						</fieldset>
						<fieldset class="form-group">
							<form:label path="jobDetails">Job details</form:label>
							<form:input path="jobDetails" id="jobDetails" type="hidden" class="form-control"
								readonly="readonly" disabled="true" />
								<div path="skills" id="editableJobDetails" contenteditable="false" readonly="readonly" disabled="true"></div>								
								
							<form:errors path="jobDetails" cssClass="text-warning" />
						</fieldset>
<fieldset class="form-group">
							<form:label path="skills">skills</form:label>
							 <form:input path="skills" id="skills" type="text" class="form-control"
								readonly="readonly" disabled="true" /> 
								
								
								
								
							<form:errors path="skills" cssClass="text-warning" />
						</fieldset>

  <%-- 
						<fieldset class="form-group">
							<form:label path="liveDate">Live Date</form:label>
							<form:input path="liveDate"  class="form-control"
								readonly="readonly" disabled="true" />
							<form:errors path="liveDate" cssClass="text-warning" />
						</fieldset>
<fieldset class="form-group">
							<form:label path="expiryDate">expiryDate</form:label>
							<form:input path="expiryDate" type="text" class="form-control"
								 readonly="readonly" disabled="true" />
							<form:errors path="expiryDate" cssClass="text-warning" />
						</fieldset> --%>
											
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
document.getElementById("editableJobDetails").innerHTML = document.getElementById("jobDetails").value; 

document.getElementById("pageTiteTxt").innerHTML = " COVID-19:"+document.getElementById("id_jobTittle").value; 
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
    background: #eeeeee;
    cursor: not-allowed;
}

#editableJobDetails:focus, #editableJobDetails:active {
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
}



</style>



<%@ include file="common/footer.jspf"%>