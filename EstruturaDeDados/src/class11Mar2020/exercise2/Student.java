package class11Mar2020.exercise2;

/*
 * @author: rhian.costa
 */
public class Student {
	
	private String name;
	
	private String email;
	
	public Student(String name, String email) {
		super();
		this.name = name;
		this.email = email;
	}
	
	public void print(int rent, int roomNumber) {
		System.out.println("");
		System.out.println("Rent #" + rent + ":");
		System.out.println("Name: " + name);
		System.out.println("Email: " + email);
		System.out.println("Room: " + roomNumber);
	}
	
	public void print(int roomNumber) {
		System.out.println(roomNumber + ": " + name + ", " + email);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
