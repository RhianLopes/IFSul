package br.com.example.atividade.enumeration;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Genre {

    MALE("Masculino"),
    FEMALE("Feminino");

    private final String value;

}
