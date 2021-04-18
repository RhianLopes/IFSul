package class04Mar2020.exercise2;

import java.util.Scanner;

/*
 * @author: rhian.costa
 */
public class Main {

	public static void main(String[] args) {
		
		final Scanner scanner = new Scanner(System.in);
		
		// Reading variables
		System.out.print("Name: ");
		final String name = scanner.next();
		
		System.out.print("Subject: ");
		final String subject = scanner.next();
		
		System.out.print("First Semester Grade: ");
		final Double firstSemesterGrade = scanner.nextDouble();
		
		System.out.print("Second Semester Grade: ");
		final Double secondSemesterGrade = scanner.nextDouble();
		
		// Create the Object Rectangle
		final Student student = new Student(name, subject, firstSemesterGrade, secondSemesterGrade);
		
		// Write the values
		System.out.println(student.getAnualMessageGrade());

	}

}
