package net.guides.springboot.todomanagement.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import net.guides.springboot.todomanagement.model.VolunteerJob;

public interface VolunteerJobRepository extends JpaRepository<VolunteerJob, Long>{
	List<VolunteerJob> findByUserName(String user);

	Optional<VolunteerJob> findByJobId(String id);
}
