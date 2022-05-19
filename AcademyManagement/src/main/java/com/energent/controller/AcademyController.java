package com.energent.controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.energent.bean.Message;
import com.energent.entity.Academy;
import com.energent.entity.Student;
import com.energent.service.AcademyService;
import com.energent.service.StudentService;


@Controller
public class AcademyController {
	
	/*
	 * è da chiedere a salvatore se il mav può essere salvato staticamente
	 * e se in questo modo si può tenere traccia degli eventi che affronta
	 * quest'ultimo.
	 */
	@Autowired
	private AcademyService academyService;
	
	@Autowired
	private StudentService studentService;
	
	private static ModelAndView mav = new ModelAndView();
	
	@GetMapping("/home")
	public ModelAndView showHomePage() {
		
		mav.setViewName("/HomePage");
		
		return mav;
	}
	
	@GetMapping("/reportHP")
	public ModelAndView showReportHP() {
		mav.setViewName("/HomePageReport");
		return mav;
	}
	
	@GetMapping("/totalReport")
	public ModelAndView showTotalReport() {
		
		mav.setViewName("/AcademiesReport");
		List<Academy> academiesList = new ArrayList<>();
		List<Student> studentList = new ArrayList<>();
		academiesList = academyService.findAllAcademies();
		if(!academiesList.isEmpty()) {
			
			for(Academy academy : academiesList) {
				studentList.addAll(studentService.findStudentsByAcademy(academy));
			}
			mav.addObject("academies", academiesList);
			mav.addObject("students", studentList);
		}else 
			
			mav.setViewName("/NoAcademy");
		return mav;
	}
	
	@GetMapping("/annualReport")
	public ModelAndView showAnnualReport() {
		
		mav.setViewName("/AcademiesReport");
		List<Academy> academiesList = new ArrayList<>();
		List<Student> studentList = new ArrayList<>();
		academiesList = academyService.findAllAcademiesForAnnualReport();
		if(!academiesList.isEmpty()) {
			
			for(Academy academy : academiesList) {
				studentList.addAll(studentService.findStudentsByAcademy(academy));
			}
			mav.addObject("academies", academiesList);
			mav.addObject("students", studentList);
		}else 
			
			mav.setViewName("/NoAcademy");
		return mav;
		
	}
	@PostMapping("/academiesHP")
	public ModelAndView showAcademyHomePage() {
		
		mav.setViewName("/HomePageAcademy");
		Academy academy = new Academy();
		
		mav.addObject("academy", academy);
		mav.addObject("message", new Message());
		
		return mav;
	}
	
	@PostMapping("/academy")
	public ModelAndView addAcademy(@ModelAttribute ("academy") Academy academy) {
		
		mav.setViewName("/academy");
		mav.addObject("academy", academy);
		return mav;
	}
	
	@PostMapping("/AcademyConfirm")
	public ModelAndView showConfirmAcademyAdded(@ModelAttribute ("academy") Academy academy) {
		
		mav.setViewName("/ConfirmAcademyAdded");
		mav.addObject("academy", academy);
		return mav;
	}
	
	@PostMapping("/confirm/{codeId}")
	public ModelAndView resultAddedAcademy(@PathVariable String codeId, @ModelAttribute("academy") Academy academy) {
		
		int res = academyService.addAcademy(academy);
		if (res == 2){// in case the date inserted is not right
			
			mav.setViewName("/ErrorAcademy");
			return mav;
		}if (res == 1) { // in case we inserted an already existing code
			
			mav.setViewName("/NotifAcademy");
			mav.addObject("academy",academy);
			return mav;
		} //in case everything checks out
			
			mav.setViewName("/ConfirmAcademy");
			return mav;	
	}
	
	@PostMapping("/academies")
	public ModelAndView showAcademies(@ModelAttribute("message")Message message) {
		/*
		 * this method is in charge of check if everything is inserted correctly
		 * and to call the page and method that is in charge with the 
		 * system's response.
		 */
		List<Academy> academies = new ArrayList<>();
		if(mav.getViewName() == "/HomePageAcademy") {	//this part is in case we come from an update page
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			mav.setViewName("/academies");
			if(message.getCode() != null) {
				
				academies = new ArrayList<>();
				Academy academy1 = academyService.findAcademybyId(message.getCode());
				academies.add(academy1);
				if(!(academies.get(0) == null)) {
					mav.addObject("academies",academies);
				}else {
					mav.setViewName("/NoAcademy");
				}
				return mav;
			}if(!(message.getName() != "")) {
				
				academies = academyService.findAcademiesByTitle(message.getName());
				if(!academies.isEmpty())
					mav.addObject("academies",academies);
				else 
					mav.setViewName("/NoAcademy");
				return mav;
			}if(!(message.getLocation() != "")) {
				
				academies = academyService.findAcademiesByLocation(message.getLocation());
				if(!academies.isEmpty())
					mav.addObject("academies",academies);
				else 
					mav.setViewName("/NoAcademy");
				mav.addObject("academies",academies);
				return mav;
			}
			if((message.getEdate()!=null) && (message.getSdate()!=null)) {
			if((!(message.getEdate().toLocalDate().format(formatter).equals("01/01/2000"))&&(!(message.getSdate().toLocalDate().format(formatter).equals("01/01/2000"))))){
					
					academies = academyService.findAcademiesByStartAndEndDate(message.getSdate().toLocalDate().format(formatter), message.getEdate().toLocalDate().format(formatter));
					if(!academies.isEmpty())
						mav.addObject("academies",academies);
					else 
						mav.setViewName("/NoAcademy");
					return mav;
			}
			}if(message.getEdate()!=null) {
			if(!(message.getEdate().toLocalDate().format(formatter).equals("01/01/2000"))){
					
					academies = academyService.findAcademiesByEndDate(message.getEdate().toLocalDate().format(formatter));
					if(!academies.isEmpty())
						mav.addObject("academies",academies);
					else 
						mav.setViewName("/NoAcademy");
					return mav;
			}
			}if(message.getSdate()!=null) {
			if(!(message.getSdate().toLocalDate().format(formatter).equals("01/01/2000"))){
					
					academies = academyService.findAcademiesByStartDate(message.getSdate().toLocalDate().format(formatter));
					if(!academies.isEmpty())
						mav.addObject("academies",academies);
					else 
						mav.setViewName("/NoAcademy");
					return mav;
			}
			}else {
			
				academies = academyService.findAcademiesForTable();
				mav.addObject("academies",academies);
				return mav;
			}
		}else {
			
		mav.setViewName("/academies");
		mav.addObject("message", new Message());
		academies = academyService.findAcademiesForTable();
		mav.addObject("academies",academies);
		}
		return mav;
}
	
	@PostMapping("/academies/{codeId}/update")
	public ModelAndView showUpdateAcademy(@PathVariable String codeId) {
		/*
		 * this method take a selected academy from the academies page and update it
		 * this academy will be shown in its info documented in the page
		 */
		mav.setViewName("/UpdateAcademy");
		
		Academy academy = academyService.findAcademybyId(codeId);
		mav.addObject("academy", academy);
		return mav;
		
	}
	
	@PostMapping("/AcademyApproved")
	public ModelAndView updateAcademies(@ModelAttribute("academy")Academy academy) {
		/*
		 * this method is called when we come from updating an accademy from the home page,
		 * after doing that if everything checks out we will be send to the academies's list
		 * page
		 */
		if (!academyService.updateAcademy(academy)) // in case the date inserted is not right
			mav.setViewName("/ErrorAcademy");
		else {	// in case everything checks out we have to set a new page to land to otherwise we will be stuck in a loop
			Academy academy1 = academyService.findAcademybyId(academy.getCodeId());
			mav.setViewName("/ConfirmAcademyUpdate");
			mav.addObject("academy", academy1);
		}
		return mav;
	}
	
	@PostMapping("/academies/{codeId}/remove")
	public ModelAndView removeWarningAcademy(@PathVariable String codeId) {
		/*
		 * this method take a selected academy from the academies page and update it
		 * this academy will be shown in its info documented in the page
		 */
		mav.setViewName("/ConfirmAcademyDelete");
		Academy academy = academyService.findAcademybyId(codeId);
		List<Student> students = studentService.findStudentsByAcademy(academyService.findAcademybyId(codeId));
		mav.addObject("academy", academy);
		mav.addObject("students", students);
		return mav;
		
	}
	
	@PostMapping("/academies/{codeId}/remove/confirm")
	public ModelAndView removeAcademy(@PathVariable String codeId) {
		/*
		 * this method take a selected academy from the academies page and update it
		 * this academy will be shown in its info documented in the page
		 */
		List<Student> students = studentService.findStudentsByAcademy(academyService.findAcademybyId(codeId));
		for(Student student: students)
			studentService.removeStudent(student.getfCode());
		if(!academyService.removeAcademy(codeId)) {
			mav.setViewName("/RemoveAcademy");
		}else{
			mav.setViewName("/ErrorAcademy");
		}
		return mav;
		
	}
	
}
