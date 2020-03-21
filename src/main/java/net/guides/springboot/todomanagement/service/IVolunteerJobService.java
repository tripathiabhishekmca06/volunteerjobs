package net.guides.springboot.todomanagement.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import net.guides.springboot.todomanagement.model.VolunteerJob;

public interface IVolunteerJobService {

	
	Optional<VolunteerJob> getVolunteerJobById(long id);

	void updateVolunteerJob(VolunteerJob todo);


	void deleteVolunteerJob(long id);
	
	VolunteerJob saveVolunteerJob(VolunteerJob volunteerJob);

	VolunteerJob addVolunteerJob(String postedBy, long primaryPhoneNumber, long alternativePhoneNumber, String jobDetails,
			String skills, String workArea, String timming, long minPayScale, long maxPayscale, Date liveDate,
			Date expiryDate, String userName);

	List<VolunteerJob> getVolunteerJobsByUser(String user);

	VolunteerJob verifyJob(long id);

	boolean verifyJobOTP(long id, String otp);

	Page<VolunteerJob> findAll(PageRequest pageRequest);

	
	Optional<VolunteerJob> getVolunteerJobByJobId(String id);

	Page<VolunteerJob> findAllByStatus(int status, PageRequest pageRequest);

	Page<VolunteerJob> findBySearchToken(String searchToken, PageRequest pageRequest);

	Page<VolunteerJob> findByStatusAndSearchToken(int status, String searchToken, PageRequest pageRequest);

}