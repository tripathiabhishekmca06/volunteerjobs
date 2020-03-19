<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>


<style>
.pagination-centered {
	text-align: center;
}

.disabled {
	pointer-events: none;
	opacity: 0.5;
}

.pointer-disabled {
	pointer-events: none;
}
</style>
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
	
						<c:forEach items="${volunteerJobs.content}" var="volunteerJob">
<%-- 						<tr>
						
						<td>
							<a href="/covid19/view-volunteerJob?id=${volunteerJob.id}" style="word-wrap: break-word;
word-break: break-word;">
      ${volunteerJob.jobId}
  </a>
							
							</td>
							<td style="word-wrap: break-word;
word-break: break-word;">${volunteerJob.jobTittle}</td>
							<td>${volunteerJob.organisation}</td>
							<td>${volunteerJob.workArea}</td>
							
							<td>${volunteerJob.primaryPhoneNumber}</td>
							<td>${volunteerJob.strStatus}</td>
							
				</tr> --%>
				
				<div class="v_card">
            <div class="v_header s_padding">
                <div class="row">
                    <a href="/covid19/view-volunteerJob?id=${volunteerJob.id}" class="col-xs-12 col-sm-12 col-md-9 col-lg-9 v_jobTitle" title="${volunteerJob.jobTittle}">${volunteerJob.jobTittle}</a>
                    <a href="/covid19/view-volunteerJob?id=${volunteerJob.id}" class="col-xs-12 col-sm-12 col-md-3 col-lg-3 v_jobId" title="${volunteerJob.jobId}">${volunteerJob.jobId}</a>
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
        
           <div class="v_footer s_padding">
                <a class="danger_btn p_l_0" href="/covid19/delete-volunteerJob?id=${volunteerJob.id}">Delete</a>
                <div class="right_align">
                    <a type="button" class="btn btn-primary" href="/covid19/activate-volunteerJob?id=${volunteerJob.id}">Activate</a>
                    <a type="button" href="/covid19/update-volunteerJob?id=${volunteerJob.id}" class="btn btn-success">Update</a>
                </div>
            </div> 
        </div>
					</c:forEach>
        
        
    </div>
    
					<div 
					class="form-group col-md-11 pagination-centered">
					<ul class="pagination">
						<li ><a
							class="pageLink"
							href="/covid19/volunteerJobs?pageNo=0">&laquo;</a>
						</li>
						<li><a
							class="pageLink"
							href="/covid19/volunteerJobs?pageNo=${prePageIndex}">&larr;</a>
						</li>
					
					<c:forEach items="${pageIndex}" var="index">
    <li ><a href="/covid19/volunteerJobs?pageNo=${index}">${index}</a></li>
    </c:forEach>	
						<li
							>
							<a class="pageLink"
							href="/covid19/volunteerJobs?pageNo=${nextPageIndex}">&rarr;</a>
						</li>
						<li
							>
							<a class="pageLink"
							href="/covid19/volunteerJobs?pageNo=${lastPageIndex}">&raquo;</a>
						</li>
					</ul>
				</div>
		
		</div>

<%@ include file="common/footer.jspf"%>