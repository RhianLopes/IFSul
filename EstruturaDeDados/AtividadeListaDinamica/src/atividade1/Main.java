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
        int count = 0;
        boolean shouldContinue = true;

        System.out.println("Save name and note of the students");
        while (shouldContinue) {
            System.out.println("Write the student name, please: ");
            final String name = scanner.next();
            System.out.println("Write the student note, please: ");
            final int note = scanner.nextInt();
            count++;
            if (MAX_OF_STUDENTS.equals(count) || note < 0) {
                shouldContinue = false;
            } else {
                students.add(new Student(name, note));
            }
        }

        System.out.println("View below your students: ");
        students.forEach(s -> System.out.println(s.toString()));
    }
}
