package br.com.ifsul.compubras.dto;

public class MelhorVendedorDto {

    private String nome;

    private Integer ano;

    private Long total;

    public MelhorVendedorDto(String nome, Integer ano, Long total) {
        this.nome = nome;
        this.ano = ano;
        this.total = total;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
