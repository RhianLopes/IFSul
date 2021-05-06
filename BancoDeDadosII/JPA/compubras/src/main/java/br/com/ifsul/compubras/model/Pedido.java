package br.com.ifsul.compubras.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.time.LocalDate;

@Table
@Entity
public class Pedido {

    @Id
    @Column(name = "codpedido")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codPedido;

    @Basic(optional = false)
    @Column(name = "prazoentrega")
    private LocalDate prazoEntrega;

    @Basic(optional = false)
    @Column(name = "datapedido")
    private LocalDate dataPedido;

    @ManyToOne
    @JoinColumn(name = "codcliente")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "codvendedor")
    private Vendedor vendedor;

    public Pedido(Integer codPedido, LocalDate prazoEntrega, LocalDate dataPedido, Cliente cliente, Vendedor vendedor) {
        this.codPedido = codPedido;
        this.prazoEntrega = prazoEntrega;
        this.dataPedido = dataPedido;
        this.cliente = cliente;
        this.vendedor = vendedor;
    }

    public Pedido() {
    }

    public Integer getCodPedido() {
        return codPedido;
    }

    public void setCodPedido(Integer codPedido) {
        this.codPedido = codPedido;
    }

    public LocalDate getPrazoEntrega() {
        return prazoEntrega;
    }

    public void setPrazoEntrega(LocalDate prazoEntrega) {
        this.prazoEntrega = prazoEntrega;
    }

    public LocalDate getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(LocalDate dataPedido) {
        this.dataPedido = dataPedido;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Vendedor getVendedor() {
        return vendedor;
    }

    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }
}
