package com.energent.service;

import java.util.List;

import com.energent.entity.Academy;
import com.energent.entity.Student;


public interface StudentService {

	public boolean addStudent(Student student, String id);
	public boolean UpdateStudent(Student student, Academy academy);
	public boolean removeStudent(String fCode);
	public Student findStudentById(String fCode);
	public List<Student> findStudentsByAcademy(Academy academy);
	public List<Student> findStudentsByLastname(String lastname);
}
