package br.com.ifsul.compubras.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity
public class Cliente {

    @Id
    @Column(name = "codcliente")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer codCliente;

    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;

    @Basic(optional = false)
    @Column(name = "endereco")
    private String endereco;

    @Basic(optional = false)
    @Column(name = "cidade")
    private String cidade;

    @Basic(optional = false)
    @Column(name = "cep")
    private String cep;

    @Basic(optional = false)
    @Column(name = "uf")
    private Character uf;

    @Basic(optional = false)
    @Column(name = "ie")
    private String ie;

    public Cliente(Integer codCliente, String nome, String endereco, String cidade, String cep, Character uf, String ie) {
        this.codCliente = codCliente;
        this.nome = nome;
        this.endereco = endereco;
        this.cidade = cidade;
        this.cep = cep;
        this.uf = uf;
        this.ie = ie;
    }

    public Cliente() {
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

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public Character getUf() {
        return uf;
    }

    public void setUf(Character uf) {
        this.uf = uf;
    }

    public String getIe() {
        return ie;
    }

    public void setIe(String ie) {
        this.ie = ie;
    }
}
