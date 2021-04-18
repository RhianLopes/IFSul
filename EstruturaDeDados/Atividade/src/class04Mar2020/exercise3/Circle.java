package class04Mar2020.exercise3;

/*
 * @author: rhian.costa
 */
public class Circle {
	
	private Double radius;
	
	public Circle(Double radius) {
		this.radius = radius;
	}
	
	public Double getArea() {
		return Math.PI * radius * radius;
 	}
	
	public Double getPerimeter() {
		return 2 * Math.PI * radius;
	}

	public Double getRadius() {
		return radius;
	}

	public void setRadius(Double radius) {
		this.radius = radius;
	}
}
