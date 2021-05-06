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

}
