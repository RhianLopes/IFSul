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
public class Produto {

    @Id
    @Column(name = "codproduto")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codProduto;

    @Basic(optional = false)
    @Column(name = "descricao")
    private String descricao;

    @Basic(optional = false)
    @Column(name = "valorunitario")
    private BigDecimal valorUnitario;

    public Produto(Integer codProduto, String descricao, BigDecimal valorUnitario) {
        this.codProduto = codProduto;
        this.descricao = descricao;
        this.valorUnitario = valorUnitario;
    }

    public Produto() {
    }

    public Integer getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(Integer codProduto) {
        this.codProduto = codProduto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public BigDecimal getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(BigDecimal valorUnitario) {
        this.valorUnitario = valorUnitario;
    }
}
