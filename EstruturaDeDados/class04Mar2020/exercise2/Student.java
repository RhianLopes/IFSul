package exercicio2;

/*
 * @author: rhian.costa
 */
public class Student {
	
	private static final Double MINIMUM_ANUAL_GRADE = 6.0;

	private String name;
	
	private String subject;
	
	private Double firstSemesterGrade;
	
	private Double secondSemesterGrade;
	
	public Student(String name, String subject, Double firstSemesterGrade, Double secondSemesterGrade) {
		this.name = name;
		this.subject = subject;
		this.firstSemesterGrade = firstSemesterGrade;
		this.secondSemesterGrade = secondSemesterGrade;
	}
	
	public String getAnualMessageGrade() {
		
		final Double anualGrade = this.getAnualGrade();
		
		String messageGrade;
		
		if (anualGrade >= MINIMUM_ANUAL_GRADE) {
			messageGrade = this.getSuccessMessage(anualGrade);
		} else {
			messageGrade = this.getUnsuccessMessage(anualGrade);
		}
		
		return messageGrade;
	}
	
	private Double getAnualGrade() {
		return (firstSemesterGrade + secondSemesterGrade) / 2;
	}
	
	private String getSuccessMessage(Double anualGrade) {
		return "Student: " + name + " Grade: " + anualGrade + " Status: APPROVED";
	}
	
	private String getUnsuccessMessage(Double anualGrade) {
		
		final Double necessaryGrade = MINIMUM_ANUAL_GRADE - anualGrade;
		
		return "Student: " + name + " Grade: " + anualGrade + " Status: DISAPPROVED by " + necessaryGrade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Double getFirstSemesterGrade() {
		return firstSemesterGrade;
	}

	public void setFirstSemesterGrade(Double firstSemesterGrade) {
		this.firstSemesterGrade = firstSemesterGrade;
	}

	public Double getSecondSemesterGrade() {
		return secondSemesterGrade;
	}

	public void setSecondSemesterGrade(Double secondSemesterGrade) {
		this.secondSemesterGrade = secondSemesterGrade;
	}
}
