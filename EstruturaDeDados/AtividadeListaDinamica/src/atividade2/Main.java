package atividade2;

import atividade2.domain.Student;

import java.util.LinkedList;
import java.util.Scanner;

public class Main {

    private static final Integer MAX_OF_STUDENTS = 12;

    private static final Scanner scanner = new Scanner(System.in);

    private static final LinkedList<Student> students = new LinkedList<>();

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
        if (students.size() == 0) {
            System.out.println("All students was deleted, we don't found anyone to be deleted");
        } else {
            students.removeLast();
            System.out.println("The last student was deleted");
        }
    }

    private static void searchAndPrintStudentByName() {
        System.out.println("Write the student name to search, please: ");
        final String name = scanner.next();
        final Student student = students.stream()
                .filter(s -> s.getName().contains(name))
                .findFirst()
                .orElse(null);
        if (student == null) {
            System.out.println("Sorry, we can't found this student by this name");
            System.out.println("Try write a more specific name");
        } else {
            final int index = students.indexOf(student);
            System.out.println("We found a student, this are the first student we found with this name");
            System.out.println("If this isn't the student wanted, please, try write a more specific name");
            System.out.println(String.format("%s, the student position is %d", student.toString(), index + 1));
        }
    }

    private static void addNewStudent() {
        final Student student = buildNewStudent();
        students.addLast(student);
    }

    private static Student buildNewStudent() {
        System.out.println("Write the student name, please: ");
        final String name = scanner.next();
        System.out.println("Write the student note, please: ");
        final int note = scanner.nextInt();

        return new Student(name, note);
    }

    private static void saveStudents() {
        System.out.println("Save name and note of the students");
        for (int i = 0; i < MAX_OF_STUDENTS; i++) {
            final Student student = buildNewStudent();
            if (student.getNote() < 0) {
                break;
            } else {
                students.addLast(student);
            }
        }
    }

    private static void printAllStudents() {
        System.out.println("View below your students: ");
        students.forEach(s -> System.out.println(s.toString()));
    }
}
