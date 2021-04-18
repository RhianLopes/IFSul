package atividade2;

import atividade2.domain.Student;

import java.util.Scanner;

public class Main {

    private static final Integer MAX_OF_STUDENTS = 12;

    private static final Scanner scanner = new Scanner(System.in);

    private static final Student[] students = new Student[MAX_OF_STUDENTS];

    public static void main(String[] args) {
        saveStudents();
        printAllStudents();
        showMenu();
    }

    private static void showMenu() {
        while (true) {
            System.out.println("\nNow you are on Menu, choose your next action: ");
            System.out.println("Write 1 to add a new student to latest position (if the position is empty)");
            System.out.println("Write 2 to search student by name");
            System.out.println("Write 3 to delete the latest student did add");
            System.out.println("Write 4 to view all students");
            final int actionId = scanner.nextInt();
            processAction(actionId);
        }
    }

    private static void processAction(int actionId) {
        switch (actionId) {
            case 1:
                addNewStudent();
                break;
            case 2:
                searchAndPrintStudentByName();
                break;
            case 3:
                deleteLastStudent();
                break;
            case 4:
                printAllStudents();
                break;
            default:
                System.out.println(String.format("We can't identify anyone action for the option %d, try another, please", actionId));
                break;
        }
    }

    private static void deleteLastStudent() {
        boolean mustDeleteLastStudent = true;
        for (int i = MAX_OF_STUDENTS - 1; i >= 0; i--) {
            if (mustDeleteLastStudent && students[i] != null) {
                System.out.println("The last student was deleted");
                System.out.println(String.format("The student deleted is %s", students[i].toString()));
                students[i] = null;
                mustDeleteLastStudent = false;
            }
        }
        if (mustDeleteLastStudent) {
            System.out.println("All students was deleted, we don't found anyone to be deleted");
        }
    }

    private static void searchAndPrintStudentByName() {
        System.out.println("Write the student name to search, please: ");
        final String name = scanner.next();
        boolean mustSearchStudentByName = true;
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            if (mustSearchStudentByName && students[i] != null && students[i].getName().contains(name)) {
                System.out.println("We found a student, this are the first student we found with this name");
                System.out.println("If this isn't the student wanted, please, try write a more specific name");
                System.out.println(String.format("%s, the student position is %d", students[i].toString(), i + 1));
                mustSearchStudentByName = false;
            }
        }
        if (mustSearchStudentByName) {
            System.out.println("Sorry, we can't found this student by this name");
            System.out.println("Try write a more specific name");
        }
    }

    private static void addNewStudent() {
        final Student student = buildNewStudent();
        boolean mustSaveNewStudent = true;
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            if (mustSaveNewStudent && students[i] == null) {
                students[i] = student;
                mustSaveNewStudent = false;
            }
        }
        if (mustSaveNewStudent) {
            System.out.println("Hasn't a empty position, try delete someone");
        } else {
            System.out.println(String.format("The new student %s was add with success!", student.getName()));
        }
    }

    private static Student buildNewStudent() {
        System.out.println("Write the student name, please: ");
        final String name = scanner.next();
        System.out.println("Write the student note, please: ");
        final int note = scanner.nextInt();

        return new Student(name, note);
    }

    private static void saveStudents() {
        boolean shouldContinue = true;

        System.out.println("Save name and note of the students");
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            if (shouldContinue) {
                final Student student = buildNewStudent();

                if (student.getNote() < 0) {
                    shouldContinue = false;
                } else {
                    students[i] = student;
                }
            }
        }
    }

    private static void printAllStudents() {
        System.out.println("View below your students: ");
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            if (students[i] != null) {
                System.out.println(String.format("%d - %s", i + 1, students[i].toString()));
            }
        }
    }
}
