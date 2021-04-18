package atividade2.domain;

public class Student {

    private String name;

    private Integer note;

    public Student(String name, Integer note) {
        this.name = name;
        this.note = note;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNote() {
        return note;
    }

    public void setNote(Integer note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Student " +
                "name: '" + name + '\'' +
                ", note: " + note;
    }
}
