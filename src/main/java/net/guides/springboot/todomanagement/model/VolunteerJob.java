package net.guides.springboot.todomanagement.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "VolunteerJob")
public class VolunteerJob {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Lob
	  @Column( length = 1000 )
	private String jobSearchTokens;
	
	
	@Override
	public String toString() {
		return "VolunteerJob [id=" + id + ", jobId=" + jobId + ", status=" + status + ", primaryPhoneNumber="
				+ primaryPhoneNumber + ", alternativePhoneNumber=" + alternativePhoneNumber + "]";
	}
	private int otpRetryCount;
	
	public int getOtpRetryCount() {
		return otpRetryCount;
	}
	public void setOtpRetryCount(int otpRetryCount) {
		this.otpRetryCount = otpRetryCount;
	}
	public String getJobSearchTokens() {
		return jobSearchTokens;
	}
	public void setJobSearchTokens(String jobSearchTokens) {
		this.jobSearchTokens = jobSearchTokens;
	}
	@Column( length = 120 )
	private String jobTittle;
	private String jobId;
	private int status;
	private String strStatus;
	private boolean acceptTerm;
	public boolean isAcceptTerm() {
		return acceptTerm;
	}
	public void setAcceptTerm(boolean acceptTerm) {
		this.acceptTerm = acceptTerm;
	}
	public String getStrStatus() {
		if(this.status==0)
			return "inactive";
		if(this.status==1)
			return "verificaion pending";
		if(this.status==2)
			return "verification failed";
		if(this.status==3)
			return "verified";
		if(this.status==4)
			return "active";
		return "NA";
	}
	public void setStrStatus(String strStatus) {
		this.strStatus = strStatus;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getJobTittle() {
		return jobTittle;
	}
	public void setJobTittle(String jobTittle) {
		this.jobTittle = jobTittle;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	@Column( length = 100 )
	private String postedBy;
	private long primaryPhoneNumber;
	private long alternativePhoneNumber;
	@Column( length = 100 )
	private String organisation;
	private String selfOrganisation;
	public String getSelfOrganisation() {
		return selfOrganisation;
	}
	public void setSelfOrganisation(String selfOrganisation) {
		this.selfOrganisation = selfOrganisation;
	}
	public String getOrganisation() {
		return organisation;
	}
	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Lob
	  @Column( length = 400 )
	private String jobDetails;
	@Lob
	  @Column( length = 100 )
	private String skills;
	@Column( length = 80 )
	private String workArea;
	@Column( length = 20 )
	private String Timming;
	private long minPayScale;
	public VolunteerJob(String postedBy, long primaryPhoneNumber, long alternativePhoneNumber, String jobDetails, String skills,
			String workArea, String timming, long minPayScale, long maxPayscale, Date liveDate, Date expiryDate,
			String userName) {
		super();
		this.postedBy = postedBy;
		this.primaryPhoneNumber = primaryPhoneNumber;
		this.alternativePhoneNumber = alternativePhoneNumber;
		this.jobDetails = jobDetails;
		this.skills = skills;
		this.workArea = workArea;
		Timming = timming;
		this.minPayScale = minPayScale;
		this.maxPayscale = maxPayscale;
		this.liveDate = liveDate;
		this.expiryDate = expiryDate;
		this.userName = userName;
	}
	public VolunteerJob() {
		// TODO Auto-generated constructor stub
	}
	private long maxPayscale;
	private Date postedDate;
	private Date liveDate;
	private Date expiryDate;
	private String userName;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VolunteerJob other = (VolunteerJob) obj;
		if (id != other.id)
			return false;
		return true;
	}
	public String getPostedBy() {
		return postedBy;
	}
	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}
	public long getPrimaryPhoneNumber() {
		return primaryPhoneNumber;
	}
	public void setPrimaryPhoneNumber(long primaryPhoneNumber) {
		this.primaryPhoneNumber = primaryPhoneNumber;
	}
	public long getAlternativePhoneNumber() {
		return alternativePhoneNumber;
	}
	public void setAlternativePhoneNumber(long alternativePhoneNumber) {
		this.alternativePhoneNumber = alternativePhoneNumber;
	}
	public String getJobDetails() {
		return jobDetails;
	}
	public void setJobDetails(String jobDetails) {
		this.jobDetails = jobDetails;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getWorkArea() {
		return workArea;
	}
	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}
	public String getTimming() {
		return Timming;
	}
	public void setTimming(String timming) {
		Timming = timming;
	}
	public long getMinPayScale() {
		return minPayScale;
	}
	public void setMinPayScale(long minPayScale) {
		this.minPayScale = minPayScale;
	}
	public long getMaxPayscale() {
		return maxPayscale;
	}
	public void setMaxPayscale(long maxPayscale) {
		this.maxPayscale = maxPayscale;
	}
	public Date getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}
	public Date getLiveDate() {
		return liveDate;
	}
	public void setLiveDate(Date liveDate) {
		this.liveDate = liveDate;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
}