package atividade1;

import atividade1.domain.Student;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    private static final Integer MAX_OF_STUDENTS = 12;

    public static void main(String[] args) {
        final Scanner scanner = new Scanner(System.in);
        final List<Student> students = new ArrayList<>();

        System.out.println("Save name and note of the students");
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            System.out.println("Write the student name, please: ");
            final String name = scanner.next();
            System.out.println("Write the student note, please: ");
            final int note = scanner.nextInt();

            if (note < 0) {
                break;
            } else {
                students.add(i, new Student(name, note));
            }
        }

        System.out.println("View below your students: ");
        students.forEach(s -> System.out.println(s.toString()));
    }
}
