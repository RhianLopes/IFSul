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

    public Vendedor(Integer codVendedor, String nome, BigDecimal salarioFixo, FaixaComissao faixaComissao) {
        this.codVendedor = codVendedor;
        this.nome = nome;
        this.salarioFixo = salarioFixo;
        this.faixaComissao = faixaComissao;
    }

    public Vendedor() {
    }

    public Integer getCodVendedor() {
        return codVendedor;
    }

    public void setCodVendedor(Integer codVendedor) {
        this.codVendedor = codVendedor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public BigDecimal getSalarioFixo() {
        return salarioFixo;
    }

    public void setSalarioFixo(BigDecimal salarioFixo) {
        this.salarioFixo = salarioFixo;
    }

    public FaixaComissao getFaixaComissao() {
        return faixaComissao;
    }

    public void setFaixaComissao(FaixaComissao faixaComissao) {
        this.faixaComissao = faixaComissao;
    }
}
