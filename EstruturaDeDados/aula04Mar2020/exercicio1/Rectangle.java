package exercicio1;

public class Rectangle {
	
	private Double width;
	
	private Double height;
	
	public Rectangle(Double width, Double height) {
		this.width = width;
		this.height = height;
	}

	public Double area() {
		return width * height;
	}
	
	public Double perimeter() {
		return (width * 2) + (height * 2);
	}
	
	public Double diagonal() {
		return Math.hypot(width, height);
	}

	public Double getWidth() {
		return width;
	}

	public void setWidth(Double widht) {
		this.width = widht;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}
}
