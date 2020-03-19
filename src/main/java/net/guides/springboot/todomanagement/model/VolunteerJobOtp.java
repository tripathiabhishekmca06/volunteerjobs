package net.guides.springboot.todomanagement.model;

public class VolunteerJobOtp {
	
	@Override
	public String toString() {
		return "VolunteerJobOtp [id=" + id + ", jobId=" + jobId + ", jobTittle=" + jobTittle + ", otp=" + otp
				+ ", otpSend=" + otpSend + ", otpRetryCount=" + otpRetryCount + ", maskedMobileForOtp="
				+ maskedMobileForOtp + "]";
	}

	private long id;
	
	private String jobId;
	
	private String jobTittle;
	
	private String otp;
	
	private String otpSend;
	
	private int otpRetryCount=0;
	
	private String maskedMobileForOtp;

	public String getMaskedMobileForOtp() {
		return maskedMobileForOtp;
	}

	public void setMaskedMobileForOtp(String maskedMobileForOtp) {
		this.maskedMobileForOtp = maskedMobileForOtp;
	}

	public int getOtpRetryCount() {
		return otpRetryCount;
	}

	public void setOtpRetryCount(int otpRetryCount) {
		this.otpRetryCount = otpRetryCount;
	}

	public String getOtpSend() {
		return otpSend;
	}

	public void setOtpSend(String otpSend) {
		this.otpSend = otpSend;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobTittle() {
		return jobTittle;
	}

	public void setJobTittle(String jobTittle) {
		this.jobTittle = jobTittle;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}
	

}
