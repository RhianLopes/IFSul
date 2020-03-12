package class11Mar2020.exercise1;

import java.util.Scanner;

/*
 * @author: rhian.costa
 */
public class Main {

	public static void main(String[] args) {
		
		final Scanner scanner = new Scanner(System.in);	
		
		// Reading variables
		System.out.println("Car Top Width: ");
		final Double carTopWidth = scanner.nextDouble();
		
		System.out.println("Car Top Height: ");
		final Double carTopHeight = scanner.nextDouble();
		
		System.out.println("Car Side Width: ");
		final Double carSideWidth = scanner.nextDouble();
		
		System.out.println("Car Side Height: ");
		final Double carSideHeight = scanner.nextDouble();
		
		System.out.println("Front Wheel Radius: ");
		final Double frontWheelRadius = scanner.nextDouble();
		
		System.out.println("Back Wheel Radius: ");
		final Double backWheelRadius = scanner.nextDouble();
		
		// Create the Car Parts
		final Rectangle carTop = new Rectangle(carTopWidth, carTopHeight);
		final Rectangle carSide = new Rectangle(carSideWidth, carSideHeight);
		
		final Circle frontWheel = new Circle(frontWheelRadius);
		final Circle backWheel = new Circle(backWheelRadius);
		
		// Create the Car
		final Car car = new Car(carTop, carSide, frontWheel, backWheel);

		// Write Info About Car
		System.out.println("Total Area Car: " + car.totalArea());
		System.out.println("Total Perimeter Car: " + car.totalPerimeter());
	}
}
