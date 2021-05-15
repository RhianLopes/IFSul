package br.com.ifsul.compubras.dto;

public class PedidoPorClienteDto {

    private Integer codCliente;

    private String nome;

    private Integer codPedido;

    public PedidoPorClienteDto(Integer codCliente, String nome, Integer codPedido) {
        this.codCliente = codCliente;
        this.nome = nome;
        this.codPedido = codPedido;
    }

    public Integer getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(Integer codCliente) {
        this.codCliente = codCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getCodPedido() {
        return codPedido;
    }

    public void setCodPedido(Integer codPedido) {
        this.codPedido = codPedido;
    }
}
