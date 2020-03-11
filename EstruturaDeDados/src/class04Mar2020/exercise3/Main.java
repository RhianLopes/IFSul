package class04Mar2020.exercise3;

import java.util.Scanner;

/*
 * @author: rhian.costa
 */
public class Main {

	public static void main(String[] args) {
		
		final Scanner scanner = new Scanner(System.in);
		
		// Reading variables
		System.out.println("Radius: ");
		final Double radius = scanner.nextDouble();
				
		// Create the Object Rectangle
		final Circle circle = new Circle(radius);
				
		// Write the values
		System.out.println("Area: " + circle.getArea());
		System.out.println("Perimeter: " + circle.getPerimeter());
	}

}
