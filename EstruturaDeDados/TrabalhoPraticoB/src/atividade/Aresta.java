package atividade;

public class Aresta<Object> {

    private Double peso;

    private Vertice<Object> inicio;

    private Vertice<Object> fim;

    public Aresta(Double peso, Vertice<Object> inicio, Vertice<Object> fim) {
        this.peso = peso;
        this.inicio = inicio;
        this.fim = fim;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Vertice<Object> getInicio() {
        return inicio;
    }

    public void setInicio(Vertice<Object> inicio) {
        this.inicio = inicio;
    }

    public Vertice<Object> getFim() {
        return fim;
    }

    public void setFim(Vertice<Object> fim) {
        this.fim = fim;
    }

}
