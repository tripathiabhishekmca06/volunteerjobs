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

<div class="container">
	<div>
		<a type="button" class="btn btn-primary btn-md" href="/covid19/add-volunteerJob">Volunteer Jobs for COVID-19</a>
	</div>
	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3>List of Volunteer Jobs</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th width="15%">Job Id</th>
						<th width="17%">Job Tittle</th>
						<th width="15%">organisation</th>
						<th width="15%">Location</th>
						<th width="12%">Contact</th>
						<th width="10%">Status</th>
						
						<!-- <th width="20%">Action</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${volunteerJobs.content}" var="volunteerJob">
						<tr>
						
						<td>
							<a href="/covid19/view-volunteerJob?id=${volunteerJob.id}" style="word-wrap: break-word;
word-break: break-word;">
      ${volunteerJob.jobId}
  </a>
							
							</td>
		<%-- 					<td>
							<a href="/view-volunteerJob?id=${volunteerJob.id}" style="word-wrap: break-word;
word-break: break-word;">
      ${volunteerJob.jobDetails}
  </a>
							
							</td> --%>
							<td style="word-wrap: break-word;
word-break: break-word;">${volunteerJob.jobTittle}</td>
							<td>${volunteerJob.organisation}</td>
							<td>${volunteerJob.workArea}</td>
							
							<td>${volunteerJob.primaryPhoneNumber}</td>
							<td>${volunteerJob.strStatus}</td>
							
				<%-- 			<td><fmt:formatDate value="${volunteerJob.liveDate}"
									pattern="dd/MM/yyyy" /></td>
				 --%>			<%-- <td>
				 
				 
				 <c:choose>
    <c:when test="${volunteerJob.status<'3'}">
       <a type="button" class="btn btn-link"
								href="/covid19/verify-volunteerJobOtp?id=${volunteerJob.id}">Verify</a>
    </c:when>  
         
    <c:otherwise>
            &nbsp;&nbsp;&nbsp;&nbsp; --
    </c:otherwise>
</c:choose>
				 
				</td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
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
	
	

</div>



<%@ include file="common/footer.jspf"%>