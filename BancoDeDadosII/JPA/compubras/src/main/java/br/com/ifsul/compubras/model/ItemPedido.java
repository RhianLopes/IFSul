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


@Entity
@Table(name = "itempedido")
public class ItemPedido {

    @Id
    @Column(name = "coditempedido")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codItemPedido;

    @ManyToOne
    @JoinColumn(name = "codpedido")
    private Pedido pedido;

    @ManyToOne
    @JoinColumn(name = "codproduto")
    private Produto produto;

    @Basic(optional = false)
    @Column(name = "quantidade")
    private Integer quantidade;

    public ItemPedido(Integer codItemPedido, Pedido pedido, Produto produto, Integer quantidade) {
        this.codItemPedido = codItemPedido;
        this.pedido = pedido;
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public ItemPedido() {
    }

    public Integer getCodItemPedido() {
        return codItemPedido;
    }

    public void setCodItemPedido(Integer codItemPedido) {
        this.codItemPedido = codItemPedido;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
}
