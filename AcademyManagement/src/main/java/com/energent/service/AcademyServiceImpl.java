package com.energent.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.energent.entity.Academy;
import com.energent.entity.Student;
import com.energent.repository.AcademyRepository;

@Service
public class AcademyServiceImpl implements AcademyService {

	
	@Autowired
	AcademyRepository academyRepository;

	@Autowired
	StudentService studentService;
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy"); //initialization of a formatter used to inform the parsing function of the pattern used
	String systemDate = LocalDate.now().format(formatter); //initialization a string with the value of the actual date
	List<Academy> resultAcademies = new ArrayList<>(); //initialization of the list used to return results
	List<Academy> academies = new ArrayList<>(); //initialization of the list used to get all the academy
	
	
	
	public int rightDate(String start, String end) {
		/*
		 * this method is used to see if the selected pair of dates can be used for an academy
		 */
		int result = 2;
		LocalDate startDate = LocalDate.parse(start, formatter); // used to parse
		LocalDate endDate = LocalDate.parse(end, formatter);
		if(startDate.isBefore(endDate)) {
			
			result = compareToActualDate(startDate);
			return result;
			}
		
		return result;
	}
	
	public int compareToActualDate(LocalDate givenDate) {
		/*
		 * this method compare the date given with the one in the system
		 * by compare if it is after or at the same day of it.
		 */
		int result = 1;
		if (givenDate.isAfter(LocalDate.parse(systemDate, formatter)) || givenDate.isEqual(LocalDate.parse(systemDate, formatter))) { // comparison between system's and starting date
		
			result = 0;
			return result;
		}
		
		return result;
	}
	
	public boolean matchingDate(String givenStartingDateString, String givenEndingDateString, LocalDate actualDate) {
		/*
		 * this method is used to find the academies to insert in the annual report, by comparing date
		 * with the actual of the system, the academy MUST have already ended
		 */
		LocalDate minexpectedDate = actualDate.minusYears(1);
		LocalDate givenStartingDate = LocalDate.parse(givenStartingDateString, formatter);
		LocalDate givenEndingDate = LocalDate.parse(givenEndingDateString, formatter);
		return (((givenStartingDate.isAfter(minexpectedDate)) || givenStartingDate.isEqual(minexpectedDate)) && ((givenEndingDate.isBefore(actualDate)) || (givenEndingDate.isEqual(actualDate))));
	}
	
	@Override
	public Academy findAcademybyId(String codeId, boolean flag) {
		/*
		 * this method is used to find an academy by a given id, by initially seeing if it exist in the database
		 * or else it will thrown an exception, the flag is used for the filtered search.
		 */
		Academy academy = new Academy();
		if (academyRepository.existsById(codeId)) 
			academy = academyRepository.findById(codeId).get();
			if(flag == true)
				academy.setStudents(studentService.findStudentsByAcademy(academy));
		return academy;
	}
	
	@Override
	public int addAcademy(Academy academy) {
		/*
		 * this method is used to insert an academy in the database, this initially check if the
		 * academy already exist by check-by-PK, if it not it will call the method in charge of checking the dates;
		 * if everithing chacks out it will add the academy.
		 */
		int result = 1;
		if (!academyRepository.existsById(academy.getCodeId())) { // control to see if exists an academy with the inserted code
			if(rightDate(academy.getStartDate(), academy.getEndDate()) == 0) { // control if the dates can be used
			
				academyRepository.save(academy);
				result = 0;
				return result;
			}else {
				
				result = 2;
				return result;
			}
		}
		
		return result;
		
	}
	
	@Override
	public boolean updateAcademy(Academy academy) {
		/*
		 * this method is in charge of updating an academy by firstly check if the date was right,
		 * if everythings checks out it will update
		 */
		boolean res=false;
		if(rightDate(academy.getStartDate(), academy.getEndDate()) == 0){ // see if the dates can be used
			res = true;
			academyRepository.save(academy);
			return res;
		}
		
		return res;
	}

	@Override
	public boolean removeAcademy(String codeId) {
		/*
		 * this method is in charge of deleting an academy, and after having done that sees if it 
		 * is still in the DB to check if the deletion was done properly
		 */
		academyRepository.deleteById(codeId);
		return academyRepository.existsById(codeId);
	}
	
	@Override
	public List<Academy> findAllAcademies(){
		/*
		 * this method will be used in every listing method and in the total report
		 */
		return academyRepository.findAll();
	}
	
	@Override
	public List<Academy> findAcademiesForTable(){
		
		/*
		 * thisa method is called to list all the accademies actually active or that
		 * are ready to start, by checking the dates of them.
		 */

		resultAcademies.clear();
		academies = findAllAcademies();
		for (Academy academy : academies) {
			int a = compareToActualDate(LocalDate.parse(academy.getEndDate(), formatter));
			if (a == 0){
				List<Student> students = studentService.findStudentsByAcademy(academy);
				academy.setStudents(students);
				resultAcademies.add(academy);
				
			}
		}
		return resultAcademies;
		
	}

	@Override
	public List<Academy> findAcademiesByTitle(String title) {
		/*
		 * this method is in charge of searching the academies by a filter by the title
		 */
		return academyRepository.findByTitle(title);
	}

	@Override
	public List<Academy> findAcademiesByLocation(String location) {
		/*
		 * this method is in charge of searching the academies by a filter by the location
		 */
		return academyRepository.findByLocation(location);
	}

	@Override
	public List<Academy> findAcademiesByStartDate(String startDate) {
		/*
		 * this method is in charge of searching the academies by a filter by the start date
		 */
		resultAcademies.clear();
		academies = findAllAcademies();
		for (Academy academy : academies) {
			int a = rightDate(startDate, academy.getStartDate());
			if (a == 0||a == 1) {
				resultAcademies.add(academy);
			}
		}
		return resultAcademies;
}

	@Override
	public List<Academy> findAcademiesByEndDate(String endDate) {
		/*
		 * this method is in charge of searching the academies by a filter by the end date
		 */
		resultAcademies.clear();
		academies = findAllAcademies();
		for (Academy academy : academies) {
			int a = rightDate(academy.getEndDate(), endDate);
			if (a == 1||a == 0) {
				resultAcademies.add(academy);
			}
		}
		return resultAcademies;
}
	
	@Override
	public List<Academy> findAcademiesByStartAndEndDate(String startDate, String endDate) {
		/*
		 * this method is in charge of searching the academies by a filter by the start and end date
		 */
		resultAcademies.clear();
		academies = findAllAcademies();
		for (Academy academy : academies) {
			int a = rightDate(academy.getEndDate(), endDate);
			int b = rightDate(startDate, academy.getStartDate());
			if ((a == 1||a == 0) && (b == 0||b == 1)) {
				resultAcademies.add(academy);
			}
		}
		return resultAcademies;
	}
	
	@Override
	public List<Academy> findAllAcademiesForAnnualReport(){
		/*
		 * this method will return all the academies that were taken a year before today
		 */
		resultAcademies.clear();
		academies = findAllAcademies();
		for(Academy academy : academies)
			if (matchingDate(academy.getStartDate(), academy.getEndDate(), LocalDate.parse(systemDate, formatter)))
				resultAcademies.add(academy);
		return resultAcademies;
	}
	
}
