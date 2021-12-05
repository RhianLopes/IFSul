package br.com.example.atividade1.model;

import java.util.List;

import br.com.example.atividade1.enumeration.Genre;
import br.com.example.atividade1.enumeration.Interest;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private String name;

    private String email;

    private String phone;

    private String birthDate;

    private Genre genre;

    private List<Interest> interests;

    @Override
    public String toString() {
        return name.concat(":").concat(genre.getValue());
    }
}
