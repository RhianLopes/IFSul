package atividade1;

import atividade1.domain.Student;

import java.util.Scanner;

public class Main {

    private static final Integer MAX_OF_STUDENTS = 12;

    public static void main(String[] args) {
        final Scanner scanner = new Scanner(System.in);

        final Student [] students = new Student[MAX_OF_STUDENTS];
        boolean shouldContinue = true;

        System.out.println("Save name and note of the students");
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            if (shouldContinue) {
                System.out.println(String.format("Write the student %d name, please: ", i + 1));
                final String name = scanner.next();
                System.out.println(String.format("Write the student %d note, please: ", i + 1));
                final int note = scanner.nextInt();

                if (note < 0) {
                    shouldContinue = false;
                } else {
                    students[i] = new Student(name, note);
                }
            }
        }

        System.out.println("View below your students: ");
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            if (students[i] != null) {
                System.out.println(students[i].toString());
            }
        }
    }
}
