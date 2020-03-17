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
		
		while (quantityStudents <= 0 || quantityStudents > 9) {
			System.out.println("Invalid number, try another");
			quantityStudents = scanner.nextInt();
		}
			
		final Student[] rooms = new Student[10];
		
		while(quantityStudents != 0) {
			
			System.out.println("What your name? ");
			final String name = scanner.next();
			
			System.out.println("What your e-mail? ");
			final String email = scanner.next();
			
			final Student student = new Student(name, email);
			
			int count = 0;
			
			boolean busy = false;
			
			while (!busy) {
				
				System.out.println("What room you want? ");
				int roomNumber = scanner.nextInt();
				
				while (roomNumber > 9 || roomNumber < 0) {
					
					System.out.println("This room don´t exists, try another (0 to 9)");
					roomNumber = scanner.nextInt();
				}
				
				if (rooms[roomNumber] == null) {
					rooms[roomNumber] = student;
					count++;
					student.print(count, roomNumber);
					busy = true;
				} else {
					System.out.println("Your room is busy. Try another");
				}
			}
			
			quantityStudents--;
		}
		
		System.out.println("");
		System.out.println("Busy Rooms: ");
		for (int i = 0; i < rooms.length; i++) {
			if (rooms[i] instanceof Student) {
				rooms[i].print(i);
			}
		}
	}
}
