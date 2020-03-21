package net.guides.springboot.todomanagement.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;
import java.util.Random;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.NoHandlerFoundException;

import net.guides.springboot.todomanagement.model.PagerModel;
import net.guides.springboot.todomanagement.model.SearchJob;
import net.guides.springboot.todomanagement.model.VolunteerJob;
import net.guides.springboot.todomanagement.model.VolunteerJobOtp;
import net.guides.springboot.todomanagement.service.IVolunteerJobService;
@Controller
public class TodoController {

	@Autowired
	private IVolunteerJobService volunteerJobService;

	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	private static final int[] PAGE_SIZES = { 10, 20};
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// Date - dd/MM/yyyy
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
/*
	@RequestMapping(value = "/list-volunteerJobs", method = RequestMethod.POST)
	public String showSearch(ModelMap model, @Valid SearchJob searchJob, BindingResult result) {
		
		
		System.out.println("model:::"+model);
		System.out.println("inputdata:::"+searchJob.getSearchTokens());
		return null;
		
	}*/
	
	//@RequestMapping(value = "/list-volunteerJobs", method = RequestMethod.GET)
	public String showTodos(@RequestParam(defaultValue = "-1", required=false) String  sortOrder,@RequestParam(defaultValue = "", required=false) String  searchTxt,@RequestParam(defaultValue = "1", required=false) Integer pageNo,@RequestParam(defaultValue = "10", required=false) Integer pageSize,ModelMap model) {
		model.put("selectedPageSize", 1);
		model.put("pageSizes", PAGE_SIZES);
		if(pageNo<1)
			pageNo=1;
		if(pageSize<0)
			pageSize=10;
		if(pageSize>100)
			pageSize=100;
		
		Page<VolunteerJob> volunteerJobs = volunteerJobService.findBySearchToken(searchTxt.toUpperCase(), new PageRequest(--pageNo, pageSize,getSortingValue(sortOrder)));
		PagerModel pager = new PagerModel(volunteerJobs.getTotalPages(),volunteerJobs.getNumber(),3);
		model.put("volunteerJobs", volunteerJobs);
		ArrayList<Integer> pageIndex= new ArrayList<>();
		
		for(int i=pager.getStartPage();i<=pager.getEndPage();i++)
			pageIndex.add(i);
		model.put("pageIndex", pageIndex);
		model.put("currPageIndex", (volunteerJobs.getNumber()+1));
		if(pager.getEndPage()==volunteerJobs.getTotalPages() )
			model.put("nextPageIndex", (pager.getEndPage()));
		else
			model.put("nextPageIndex", (pager.getEndPage()+1));
		
		model.put("lastPageIndex", (volunteerJobs.getTotalPages()));
		
		
		if(pager.getStartPage()==volunteerJobs.getTotalPages() )
			model.put("prePageIndex", (pager.getStartPage()));
		else
			model.put("prePageIndex", (pager.getStartPage()-1));
		
		model.put("searchTxt", searchTxt);

		model.put("sortOrder", sortOrder);

		model.addAttribute("searchJob", new SearchJob());
		return "list-volunteerJobs";
	}

	private Sort getSortingValue(String sortBy) {
		if(sortBy.equals("2"))
		return	Sort.by("postedBy").descending();
		if(sortBy.equals("1"))
			return	Sort.by("postedBy").ascending();
		if(sortBy.equals("3"))
			return Sort.by("status").descending();
		if(sortBy.equals("4"))
			return Sort.by("status").ascending();
		
		return Sort.by("postedBy").ascending();
	}
	
	@RequestMapping(value = "/volunteerJobs", method = RequestMethod.GET)
	public String volunteerJobs(@RequestParam(defaultValue = "-1", required=false) String  sortOrder,@RequestParam(defaultValue = "", required=false) String  searchTxt,@RequestParam(defaultValue = "1", required=false) Integer pageNo,@RequestParam(defaultValue = "10", required=false) Integer pageSize,ModelMap model) {
		model.put("selectedPageSize", 1);
		model.put("pageSizes", PAGE_SIZES);
		if(pageNo<1)
			pageNo=1;
		if(pageSize<0)
			pageSize=10;
		if(pageSize>100)
			pageSize=100;
		
		Page<VolunteerJob> volunteerJobs = volunteerJobService.findByStatusAndSearchToken(4,searchTxt.toUpperCase(), new PageRequest(--pageNo, pageSize,getSortingValue(sortOrder)));
		PagerModel pager = new PagerModel(volunteerJobs.getTotalPages(),volunteerJobs.getNumber(),3);
		model.put("volunteerJobs", volunteerJobs);
		ArrayList<Integer> pageIndex= new ArrayList<>();
		
		for(int i=pager.getStartPage();i<=pager.getEndPage();i++)
			pageIndex.add(i);
		model.put("pageIndex", pageIndex);
		model.put("currPageIndex", (volunteerJobs.getNumber()+1));
		if(pager.getEndPage()==volunteerJobs.getTotalPages() )
			model.put("nextPageIndex", (pager.getEndPage()));
		else
			model.put("nextPageIndex", (pager.getEndPage()+1));
		
		model.put("lastPageIndex", (volunteerJobs.getTotalPages()));
		
		
		if(pager.getStartPage()==volunteerJobs.getTotalPages() )
			model.put("prePageIndex", (pager.getStartPage()));
		else
			model.put("prePageIndex", (pager.getStartPage()-1));
		
		model.put("searchTxt", searchTxt);

		model.put("sortOrder", sortOrder);

		model.addAttribute("searchJob", new SearchJob());
		return "list-volunteerJobsForExt";
	}

	private String getLoggedInUserName(ModelMap model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			return ((UserDetails) principal).getUsername();
		}

		return principal.toString();
	}

	@RequestMapping(value = "/add-volunteerJob", method = RequestMethod.GET)
	public String showAddTodoPage(ModelMap model) {
		model.addAttribute("volunteerJob", new VolunteerJob());
		return "volunteerJob";
	}

	//@RequestMapping(value = "/delete-volunteerJob", method = RequestMethod.GET)
	public String deleteTodo(@RequestParam long id) {
		volunteerJobService.deleteVolunteerJob(id);
		// service.deleteTodo(id);
		return "redirect:/list-volunteerJobs";
	}

	//@RequestMapping(value = "/update-volunteerJob", method = RequestMethod.GET)
	public String showUpdateTodoPage(@RequestParam long id, ModelMap model) {
		VolunteerJob volunteerJob = volunteerJobService.getVolunteerJobById(id).get();
		model.put("volunteerJob", volunteerJob);
		return "volunteerJob";
	}
	
	@RequestMapping(value = "/view-volunteerJob", method = RequestMethod.GET)
	public String showTodoPage(@RequestParam String id, ModelMap model) {
		Optional<VolunteerJob> vol= volunteerJobService.getVolunteerJobByJobId(id);
		if(vol==null || !vol.isPresent())
		{
			throw new ResponseStatusException(
					  HttpStatus.NOT_FOUND, "entity not found"
					);	
		}
		VolunteerJob volunteerJob = vol.get();
		model.put("volunteerJob", volunteerJob);
		return "volunteerJobView";
	}

	//@RequestMapping(value = "/update-volunteerJob", method = RequestMethod.POST)
	public String updateTodo(ModelMap model, @Valid VolunteerJob volunteerJob, BindingResult result) {

		if (result.hasErrors()) {
			return "volunteerJob";
		}
		VolunteerJob job= volunteerJobService.getVolunteerJobById(volunteerJob.getId()).get();

		volunteerJob.setJobId(job.getJobId());
		volunteerJob.setUserName(getLoggedInUserName(model));
		volunteerJobService.updateVolunteerJob(volunteerJob);
		return "redirect:/verify-volunteerJobOtp?id="+volunteerJob.getId();
	}

	@RequestMapping(value = "/add-volunteerJob", method = RequestMethod.POST)
	public String addTodo(ModelMap model, @Valid VolunteerJob volunteerJob, BindingResult result) {

		if (result.hasErrors()) {
			return "volunteerJob";
		}
		Random rnd = new Random();
		int i=100000 + rnd.nextInt(900000);
		volunteerJob.setJobId("VL"+dateFormat.format(new Date()) + i);
		volunteerJob.setUserName(getLoggedInUserName(model));
		volunteerJob.setStatus(0);
		volunteerJob= volunteerJobService.saveVolunteerJob(volunteerJob);
		return "redirect:/verify-volunteerJobOtp?id="+volunteerJob.getId();
	}
	
	

	@RequestMapping(value = "/verify-volunteerJobOtp", method = RequestMethod.GET)
	public String verifyJob(@RequestParam long id, ModelMap model) {
		
	
		VolunteerJob volunteerJob =	volunteerJobService.verifyJob(id);
		VolunteerJobOtp volunteerJobOtp= new VolunteerJobOtp();
		volunteerJobOtp.setId(volunteerJob.getId());
		volunteerJobOtp.setJobId(volunteerJob.getJobId());
		volunteerJobOtp.setJobTittle(volunteerJob.getJobTittle());
		if(volunteerJob.getStatus()>2)
		volunteerJobOtp.setOtpSend("1");
		
		
		volunteerJobOtp.setOtpRetryCount(volunteerJob.getOtpRetryCount());
		volunteerJobOtp.setMaskedMobileForOtp(("xxxxxx"+(volunteerJob.getAlternativePhoneNumber()%10000)));
		model.put("volunteerJobOtp", volunteerJobOtp);
		System.out.println(volunteerJobOtp.toString());
		
		return "volunteerJobOtp";
		
	}
	
	
	@RequestMapping(value = "/verify-volunteerJobOtp", method = RequestMethod.POST)
	public String verifyJobOTP(@RequestParam long id,@RequestParam String otp) {
		boolean verfied=volunteerJobService.verifyJobOTP(id,otp);
		
		// service.deleteTodo(id);
		return "redirect:/verify-volunteerJobOtp?id="+id;
	}
	
	//@RequestMapping(value = "/activate-volunteerJob", method = RequestMethod.GET)
	public String activateJobOTP(@RequestParam long id) {
		
	VolunteerJob  volunteerJob= volunteerJobService.getVolunteerJobById(id).get();
	volunteerJob.setStatus(4);
	volunteerJobService.updateVolunteerJob(volunteerJob);
		
		// service.deleteTodo(id);
		return "redirect:/list-volunteerJobs";
	}
	
	//@RequestMapping(value = "/deactivate-volunteerJob", method = RequestMethod.GET)
	public String deactivateJobOTP(@RequestParam long id) {
		
	VolunteerJob  volunteerJob= volunteerJobService.getVolunteerJobById(id).get();
	volunteerJob.setStatus(0);
	volunteerJobService.updateVolunteerJob(volunteerJob);
		
		// service.deleteTodo(id);
		return "redirect:/list-volunteerJobs";
	}
	
	
	 @ExceptionHandler(NoHandlerFoundException.class)
	    public String handle(Exception ex) {
	        return "redirect:/404";
	    }

	    @RequestMapping(value = {"/404"}, method = RequestMethod.GET)
	    public String NotFoudPage() {
	        return "redirect:/volunteerJobs";

	    }
	    
	    
	
}
