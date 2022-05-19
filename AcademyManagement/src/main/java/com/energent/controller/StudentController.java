package com.energent.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.energent.entity.Academy;
import com.energent.entity.Student;
import com.energent.service.AcademyService;
import com.energent.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired
	private AcademyService academyService;
	@Autowired
	private StudentService studentService;
	
	private String page= "redirect:/academies/{codeId}/students";
	
	private static ModelAndView mav = new ModelAndView();
	
	@PostMapping("/academies/{codeId}/students/add")
	public ModelAndView newStudent(@ModelAttribute("student")Student student, @PathVariable String codeId) {
		
		mav.setViewName("/ConfirmStudentAdded");
		mav.addObject("student", student);
		return mav;
	}
	
	@PostMapping("/academies/{codeId}/students/add/{fCode}")
	public ModelAndView addStudent(@ModelAttribute("student")Student student, @PathVariable String codeId, @PathVariable String fCode) {
		
		if(!studentService.addStudent(student, codeId)){
			mav.setViewName("/NotifStudent");
			mav.addObject("student", student);
		}else {
		
			mav.setViewName("/ConfirmStudent");
		}
		return mav;
	}

	
	@PostMapping("/academies/{codeId}/students")
	public ModelAndView showListStudent(@PathVariable String codeId) {
		
		mav.setViewName(page);
		return mav;
	}

	@GetMapping("/academies/{codeId}/students")
	public ModelAndView showUpdatedStudentList(@PathVariable String codeId) {
	
		mav.setViewName("/students");
		List<Student> students = studentService.findStudentsByAcademy(academyService.findAcademybyId(codeId));
		Academy academy = academyService.findAcademybyId(codeId);
		mav.addObject("academy",academy);
		mav.addObject("students",students);
		return mav;
	}

	@PostMapping("/academies/{codeId}/students/student") /* richiesta su student.jsp*/
	public ModelAndView addNewStudent(@PathVariable String codeId){
		
		Academy academy = academyService.findAcademybyId(codeId);
		Student student = new Student();
		student.setAcademy(academy);
		
		mav.setViewName("/student");
		mav.addObject("student", student);
		mav.addObject("academy", academy);
		return mav;
			
	}


	@PostMapping ("/academies/{codeId}/students/update/{fCode}")
	public ModelAndView showUpdateStudent(@PathVariable String codeId, @PathVariable String fCode) {
		Academy academy = academyService.findAcademybyId(codeId);
		Student student = studentService.findStudentById(fCode);
		student.setAcademy(academy);
		mav.setViewName("/UpdateStudent");
		mav.addObject("student", student);
		mav.addObject("academy", academy);
		return mav;
	}

	@PostMapping ("/academies/{codeId}/students/update/approved")
	public ModelAndView ConfirmUpdate(@PathVariable String codeId, @ModelAttribute("student") Student student) {
		
		studentService.UpdateStudent(student, academyService.findAcademybyId(codeId));
		mav.setViewName("/ConfirmStudentUpdate");
		mav.addObject("student", student);
		mav.addObject("academy", academyService.findAcademybyId(codeId));
		return mav;
	}

	@PostMapping ("/academies/{codeId}/students/remove/{fCode}")
	public ModelAndView confirmRemove(@PathVariable String codeId,@PathVariable String fCode) {
			
		Student student =studentService.findStudentById(fCode);
		mav.setViewName("/ConfirmStudentDelete");
		mav.addObject("student", student);
		return mav;
		
		
	}

	@PostMapping("/academies/{codeId}/students/remove/confirm")
	public ModelAndView showRemoveStudent(@PathVariable String codeId,@ModelAttribute("student")Student student) {
		
		if(!studentService.removeStudent(student.getfCode())) {
			mav.setViewName("/RemoveStudent");
		}else {
			mav.setViewName("/ErrorStudent");
		}
		return mav;
		
		
	}

}
