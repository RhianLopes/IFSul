package br.com.example.atividade.repository;

import java.util.ArrayList;
import java.util.List;

import br.com.example.atividade.model.User;

public class UserRepository {

    private final static List<User> USERS = new ArrayList<>();

    public static void add(User user) {
        USERS.add(user);
    }

    public static void add(int position, User user) {
        USERS.set(position, user);
    }

    public static List<User> findAll() {
        return USERS;
    }

    public static User findByPosition(int position) {
        return USERS.get(position);
    }
}
