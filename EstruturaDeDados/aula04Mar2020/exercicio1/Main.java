package exercicio1;

import java.util.Scanner;
import exercicio1.*;

public class Main {

	public static void main(String[] args) {
		
		// Scanner to read numbers
		final Scanner scanner = new Scanner(System.in);
		
		// Reading variables
		final Double width = scanner.nextDouble();
		final Double height = scanner.nextDouble();
		
		// Create the Object Rectangle
		final Rectangle rectangle = new Rectangle(width, height);
		
		// Write the values
		System.out.println("AREA: " + rectangle.area());
		System.out.println("PERIMETER: " + rectangle.perimeter());
		System.out.println("DIAGONAL: " + rectangle.diagonal());
	}
}
