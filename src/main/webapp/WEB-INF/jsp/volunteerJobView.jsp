<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<style>
    .p_0 {
        padding: 0;
    }
    .m_0 {
        margin: 0;
    }
    .s_padding {
        padding: 10px 25px;
    }
    
    .v_card {
        border: 1px solid #fafafa;
        border-radius: 4px;
        margin-bottom: 20px;
        background-color: #fff;
        -webkit-box-shadow: 0 1px 4px 0 rgba(0,0,0,.17);
        box-shadow: 0px 1px 4px 0px rgba(0,0,0,.17);
    }
    
    .v_header {
        background: #d9edf7;
        /* border-bottom: 1px solid #ccc; */
        color: #4a4a4a;
        font-size: 16px;
        font-weight: 700;
        border-radius: 4px;
    }
    .v_jobTitle, .v_jobId {
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .v_jobTitle:hover, .v_jobId:hover {
        text-decoration: none;
        cursor: pointer;
    }
    .v_card_body {
        padding: 25px;
    }
    .v_jobId {
        margin-left: auto;
        font-weight: 700;
        font-size: 13px;
        letter-spacing: 1px;
    }
    .v_footer {
        background: #fafafa;
        display: flex;
        border-radius: 4px;
    }
     .right_align{ 
         margin-left: auto;
     }
     
     .danger_btn {
        padding: 6px 12px;
        color: #d43f3a;
        cursor: pointer;
     }
     .danger_btn:hover {
         cursor: pointer;
         text-decoration: none;
         color: #d43f3a;
     }
      
     .p_l_0 {
         padding-left: 0;
     }
     .p_r_0 {
         padding-right: 0;
     }
     .field_container {
        display: flex;
        padding: 5px 0;
     }
     .v_title {
         font-size: 14px;
         color: #999;
         font-weight: 400;
     }
     .v_content {
         font-size: 14px;
         font-weight: 700;
         color: #4a4a4a;
         margin: 0;
         padding: 0 8px;
         overflow: hidden;
         text-overflow: ellipsis;
     }
</style>

<div class="container">
	
	
	<div class="container volunteer_lisitng">
    <div style='display: flex'>
		<a type="button" class="btn btn-primary btn-md" style='margin-left: auto;'  href="/covid19/add-volunteerJob">Post Volunteer Jobs for COVID-19</a>
	</div>
	<br>
	
						
				<div class="v_card">
            <div class="v_header s_padding">
                <div class="row">
                    <a href="/covid19/view-volunteerJob?id=${volunteerJob.jobId}" class="col-xs-12 col-sm-12 col-md-9 col-lg-9 v_jobTitle" title="${volunteerJob.jobTittle}">${volunteerJob.jobTittle}</a>
                    <a href="/covid19/view-volunteerJob?id=${volunteerJob.jobId}" class="col-xs-12 col-sm-12 col-md-3 col-lg-3 v_jobId" title="${volunteerJob.jobId}">${volunteerJob.jobId}</a>
                </div>
            </div>
        
            <div class="v_card_body  s_padding">
                <div class="row m_0">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 p_0">
        
                        <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Organization: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="${volunteerJob.organisation}">${volunteerJob.organisation}</p>
                        </div>
        
                        <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Location: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="${volunteerJob.workArea}">${volunteerJob.workArea}</p>
                        </div>
        
                        <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Desired Skills: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="${volunteerJob.skills}">${volunteerJob.skills}</p>
                        </div>
                        
                          <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Job Details: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="" id="editableJobDetails"></p>
                            <input  id="jobDetails" type="hidden" 
								value="${volunteerJob.jobDetails}" />
							
                        </div>
                         <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Timings: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="">${volunteerJob.timming}</p>
                        </div>
                    </div>
        
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 ">
        
                        <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Status: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="">${volunteerJob.strStatus}</p>
                        </div>
        
                        <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Contact: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="">${volunteerJob.primaryPhoneNumber}</p>
                        </div>
                         <div class="field_container">
                            <label class="v_title col-lg-2 col-md-2 col-sm-12 col-xs-12 p_0">Email: </label>
                            <p class="v_content col-lg-10 col-md-10 col-sm-12 col-xs-12" title="">${volunteerJob.email}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	    
        
    </div>
	
	
	
</div>
<script type="text/javascript">
document.getElementById("editableJobDetails").innerHTML = document.getElementById("jobDetails").value; 

document.getElementById("pageTiteTxt").innerHTML = " COVID-19:"+document.getElementById("id_jobTittle").value; 
document.title = "COVID-19:"+document.getElementById("id_jobTittle").value;

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