package com.energent.service;

import java.util.List;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energent.entity.Academy;
import com.energent.entity.Student;
import com.energent.repository.AcademyRepository;
import com.energent.repository.StudentRepository;
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentRepository studentRepository;
	@Autowired
	AcademyRepository academyRepository;
	
	@Override
	public boolean addStudent(Student student, String id) {
		/*
		 * this method is used to insert a student in the database, this initially check if the
		 * student already exist by check-by-PK, if everithing chacks out it will add the student.
		 */
		boolean result = false;
		Academy academy = academyRepository.findById(id).get();
		if (!studentRepository.existsById(student.getfCode())) {
			student.setAcademy(academy);
			studentRepository.save(student);
			result = true;
			return result;
		}
		return result;
	}
	
	public boolean UpdateStudent(Student student, Academy academy) {
		/*
		 * this method is in charge of updating a student, and chacks if the inserted student
		 * is in the system as it should
		 */
		student.setAcademy(academy);
		studentRepository.save(student);
		Student dummy = findStudentById(student.getfCode());
		return (student.getfCode()==dummy.getfCode() && student.getFirstname()==dummy.getFirstname() && student.getLastname()==dummy.getLastname()
				&& student.getAge()==dummy.getAge() && student.getAcademy().getCodeId()==dummy.getAcademy().getCodeId());
  
	
}
	
	@Override
	public boolean removeStudent(String fCode) {
		/*
		 * this method is in charge of deleting a student, and after having done that sees if it 
		 * is still in the DB to check if the deletion was done properly
		 */
		studentRepository.deleteById(fCode);
		return studentRepository.existsById(fCode);
	}

	@Override
	public List<Student> findStudentsByAcademy(Academy academy) {
		/*
		 * this method will be used in every listing method and in the total and annual report
		 */
		List<Student> students = studentRepository.findByAcademy(academy);		
		return students;
		
	}

	@Override
	public List<Student> findStudentsByLastname(String lastname) {
		
		return studentRepository.findByLastname(lastname);
	}
	
	@Override
	public Student findStudentById(String fCode) {
		/*
		 * this method is used to search for a student by his PK
		 */
		return studentRepository.findById(fCode).get();
	}
}
