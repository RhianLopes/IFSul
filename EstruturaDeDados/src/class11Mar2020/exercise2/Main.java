package class11Mar2020.exercise2;

import java.util.Scanner;

/*
 * @author: rhian.costa
 */
public class Main {

	public static void main(String[] args) {
		
		final Scanner scanner = new Scanner(System.in);	
		
		System.out.println("How many rooms you need? ");
		int quantityStudents = scanner.nextInt();
		
		if (quantityStudents >= 0 && quantityStudents <= 9) {
			
			final Student[] rooms = new Student[10];
			
			while(quantityStudents != 0) {
				
				System.out.println("What your name? ");
				final String name = scanner.next();
				
				System.out.println("What your e-mail? ");
				final String email = scanner.next();
				
				System.out.println("What room you want? ");
				int roomNumber = scanner.nextInt();
				
				while (roomNumber > 9 || roomNumber < 0) {
					
					System.out.println("This room don´t exists, try another (0 to 9)");
					roomNumber = scanner.nextInt();
				}
				
				quantityStudents--;
			}
			
		} else {
			
			System.out.println("Oh no!");
		}	
	}
}
