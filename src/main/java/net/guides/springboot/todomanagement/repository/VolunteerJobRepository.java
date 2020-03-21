package net.guides.springboot.todomanagement.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import net.guides.springboot.todomanagement.model.VolunteerJob;

public interface VolunteerJobRepository extends JpaRepository<VolunteerJob, Long>{
	List<VolunteerJob> findByUserName(String user);

	Optional<VolunteerJob> findByJobId(String id);
	Page<VolunteerJob> findByStatus(int status, Pageable pageRequest);
	Page<VolunteerJob> findByStatusAndJobSearchTokensContaining(int status,String jobSearchTokens, Pageable pageRequest);
	Page<VolunteerJob> findByJobSearchTokensContaining(String searchToken, Pageable pageRequest);

}
