package class11Mar2020.exercise1;

/*
 * @author: rhian.costa
 */
public class Car {

	private Rectangle carTop;
	
	private Rectangle carSide;
	
	private Circle frontWheel;
	
	private Circle backWheel;

	public Car(Rectangle carTop, Rectangle carSide, Circle frontWheel, Circle backWheel) {
		this.carTop = carTop;
		this.carSide = carSide;
		this.frontWheel = frontWheel;
		this.backWheel = backWheel;
	}
	
	public Double totalArea() {
		return carTop.area() + carSide.area() + frontWheel.area() + backWheel.area();
	}
	
	public Double totalPerimeter() {
		return carTop.perimeter() + carSide.perimeter() + frontWheel.perimeter() + backWheel.perimeter();
	}

	public Rectangle getCarTop() {
		return carTop;
	}

	public void setCarTop(Rectangle carTop) {
		this.carTop = carTop;
	}

	public Rectangle getCarSide() {
		return carSide;
	}

	public void setCarSide(Rectangle carSide) {
		this.carSide = carSide;
	}

	public Circle getFrontWheel() {
		return frontWheel;
	}

	public void setFrontWheel(Circle frontWheel) {
		this.frontWheel = frontWheel;
	}

	public Circle getBackWheel() {
		return backWheel;
	}

	public void setBackWheel(Circle backWheel) {
		this.backWheel = backWheel;
	}
}
