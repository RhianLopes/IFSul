package br.com.ifsul.compubras.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Table
@Entity
public class Vendedor {

    @Id
    @Column(name = "codvendedor")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codVendedor;

    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;

    @Basic(optional = false)
    @Column(name = "salariofixo")
    private BigDecimal salarioFixo;

    @Basic(optional = false)
    @Enumerated(EnumType.STRING)
    @Column(name = "faixacomissao", columnDefinition="enum('A', 'B', 'C', 'D')")
    private FaixaComissao faixaComissao;

}
