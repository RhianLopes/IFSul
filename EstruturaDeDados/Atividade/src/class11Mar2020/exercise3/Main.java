package class11Mar2020.exercise3;

import java.util.Random;
import java.util.Scanner;

/*
 * @author: rhian.costa
 */
public class Main {

	public static void main(String[] args) {
		
		final Scanner scanner = new Scanner(System.in);
		
		final Random random = new Random();
		
		final int [][] sea = new int [4][4];
		
		for (int c = 1; c <= 5; c++) {
		
			int x = random.nextInt(4);
			int y = random.nextInt(4);
			
			if (sea[x][y] == 1) {
				c--;
			} else {
				sea[x][y] = 1;
			}
		}
		
		for (int h = 0; h <= 3; h++) {
			for (int e = 0; e <= 3; e++) {
				if (e == 3) {
					System.out.println(" " + sea[h][e]);
				} else {
					System.out.print(" " + sea[h][e]);
				}
			}
		}
		
		for (int j = 1; j <= 10; j++ ) {
			
			boolean correctCoordinates = false;
			
			int x = 0;
			int y = 0;
			
			while (!correctCoordinates) {
				
				System.out.println("Choose the x and y coordinates on the map: ");
				x = scanner.nextInt();
				y = scanner.nextInt();
				
				if (x <= 3 && x >= 0 && y <= 3 && y >= 0) {
					correctCoordinates = true;
				} else {
					System.out.println("Wrong coordinates :c ");
					System.out.println(" ");
				}
			}
			

			switch (sea[x][y]) {
				case 1:
					System.out.println("Fire!");
					sea[x][y] = 2;
					break;
				case 0:
					System.out.println("Water!");
					break;
				default:
					System.out.println("Have you played here!");
					break;
			}
			
			for (int h = 0; h <= 3; h++) {
				for (int e = 0; e <= 3; e++) {
					if (e == 3) {
						System.out.println(" " + sea[h][e]);
					} else {
						System.out.print(" " + sea[h][e]);
					}
				}
			}
		}
		
		System.out.println(" ");
		System.out.println("###### END GAME ######");
		System.out.println(" ");
		for (int h = 0; h <= 3; h++) {
			for (int e = 0; e <= 3; e++) {
				if (e == 3) {
					System.out.println(" " + sea[h][e]);
				} else {
					System.out.print(" " + sea[h][e]);
				}
			}
		}
	}
}
