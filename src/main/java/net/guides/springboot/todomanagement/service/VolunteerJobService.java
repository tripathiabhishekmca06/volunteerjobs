package net.guides.springboot.todomanagement.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import net.guides.springboot.todomanagement.model.VolunteerJob;
import net.guides.springboot.todomanagement.repository.VolunteerJobRepository;

@Service
public class VolunteerJobService implements IVolunteerJobService {

	
	
	
	@Value("${otp.dns}")
	private String otpDns;
	
	@Autowired
	private VolunteerJobRepository todoRepository;

	@Override
	public List<VolunteerJob> getVolunteerJobsByUser(String user) {
		return todoRepository.findByUserName(user);
	}

	@Override
	public Optional<VolunteerJob> getVolunteerJobById(long id) {
		return todoRepository.findById(id);
	}
	@Override
	public Optional<VolunteerJob> getVolunteerJobByJobId(String id) {
		return todoRepository.findByJobId(id);
	}

	@Override
	public void updateVolunteerJob(VolunteerJob todo) {
		todo.setJobSearchTokens(todo.getJobTittle()+" , "+ todo.getJobId() +" , "+ todo.getWorkArea()+" , "+ todo.getJobDetails() +" , "+ todo.getOrganisation());
		todoRepository.save(todo);
	}

	@Override
	public VolunteerJob addVolunteerJob(String postedBy, long primaryPhoneNumber, long alternativePhoneNumber, String jobDetails, String skills,
			String workArea, String timming, long minPayScale, long maxPayscale, Date liveDate, Date expiryDate,
			String userName) {
		return todoRepository.save(new VolunteerJob(postedBy,  primaryPhoneNumber,  alternativePhoneNumber,  jobDetails,  skills,
				 workArea,  timming,  minPayScale,  maxPayscale,  liveDate,  expiryDate,
				 userName));
	}

	@Override
	public void deleteVolunteerJob(long id) {
		Optional<VolunteerJob> todo = todoRepository.findById(id);
		if (todo.isPresent()) {
			todoRepository.delete(todo.get());
		}
	}

	@Override
	public VolunteerJob saveVolunteerJob(VolunteerJob todo) {
		
		todo.setJobSearchTokens(todo.getJobTittle()+" , "+ todo.getJobId() +" , "+ todo.getWorkArea()+" , "+ todo.getJobDetails() +" , "+ todo.getOrganisation());
		return todoRepository.save(todo);
	}

	@Override
	public void verifyJob(long id) {
		
		VolunteerJob volunteerJob= todoRepository.findById(id).get();
		 
   String url =  otpDns +"/v0/token/send";

   RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	headers.set("appid", "100");
	headers.set("systemid", "jobseeker");
	 headers.set("accept", "application/json");
     headers.set("content-type", "application/json");
       JSONObject map = new JSONObject();
     JSONObject tokenValueMap = new JSONObject();

     JSONObject addInfoValue = new JSONObject();
     JSONObject communicationInfo = new JSONObject();
	
     JSONObject fromValue = new JSONObject();

     JSONObject sms = new JSONObject();
	
	ArrayList<String> mobile= new ArrayList<>();
	mobile.add(volunteerJob.getAlternativePhoneNumber()+"");
	
	communicationInfo.put("mobileNo", mobile);
	communicationInfo.put("sendSms", true);
	communicationInfo.put("eventCode", "mnj_mobile_verify_otp_sms");
	communicationInfo.put("name", "deepak");
	
	tokenValueMap.put("flowId","login");
	tokenValueMap.put("uniqueId", volunteerJob.getAlternativePhoneNumber());
	tokenValueMap.put("expiry", 30);
	tokenValueMap.put("tokenType", "numeric");
	tokenValueMap.put("tokenLen", 6);
	
	addInfoValue.put("username", "abc@gamil.com");
	sms.put("id", "naukri");
	sms.put("name", "deepak");

	fromValue.put("sms", sms);
	communicationInfo.put("from", fromValue);
	
	map.put("tokenInfo", tokenValueMap);
	map.put("communicationInfo", communicationInfo);
		HttpEntity<String> entity = new HttpEntity<>(map.toString(), headers);
	try {
		System.out.println("Request for get otp:::"+url);
		
		System.out.println("Request json for get otp:::"+map.toString());
		
		ResponseEntity<String> response =restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

		// check response
		if (response.getStatusCode().is2xxSuccessful()) {
		    volunteerJob.setStatus(1);
		    System.out.println("Request response for get otp:::"+response.getStatusCode().toString());
		    todoRepository.save(volunteerJob);
		} else {
		    System.out.println("Request Failed for get otp:::"+url);
		    
		}
	} catch (RestClientException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	}

	@Override
	public boolean verifyJobOTP(long id, String otp) {
		
		
		
String url = otpDns+"/v0/token/verify";
VolunteerJob volunteerJob= todoRepository.findById(id).get();

	// create an instance of RestTemplate
	RestTemplate restTemplate = new RestTemplate();

	// create headers
	HttpHeaders headers = new HttpHeaders();
	headers.set("appid", "100");
	headers.set("systemid", "12345");
	 headers.set("accept", "application/json");
     headers.set("content-type", "application/json");
    
          JSONObject map = new JSONObject();
     	map.put("uniqueId", ""+volunteerJob.getAlternativePhoneNumber());
	map.put("flowId", "login");
	map.put("token", otp);
		HttpEntity<String> entity = new HttpEntity<>(map.toString(), headers);
	ResponseEntity<String> response=null;
	try {
		response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
	} catch (RestClientException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
	if (response !=null && response.getStatusCode().is2xxSuccessful()) {
		volunteerJob.setStatus(3);
		return true;
	} else {
	    System.out.println("Request Failed for post::"+url);
	    
	    volunteerJob.setStatus(2);
	    volunteerJob.setOtpRetryCount(volunteerJob.getOtpRetryCount()+1);
	}
	todoRepository.save(volunteerJob);
	return false;
	}

	@Override
	public Page<VolunteerJob> findAll(PageRequest pageRequest) {
		return todoRepository.findAll(pageRequest);
	}
	
	@Override
	public Page<VolunteerJob> findAllByStatus(int status,PageRequest pageRequest) {
		return todoRepository.findByStatus(status,pageRequest);
	}
}
	
	