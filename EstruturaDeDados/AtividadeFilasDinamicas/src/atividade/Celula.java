package atividade;

public class Celula {

    private Celula proxima;

    private Integer elemento;

    public Celula(Celula proxima, Integer elemento) {
        this.proxima = proxima;
        this.elemento = elemento;
    }

    public Celula getProxima() {
        return proxima;
    }

    public void setProxima(Celula proxima) {
        this.proxima = proxima;
    }

    public Integer getElemento() {
        return elemento;
    }

    public void setElemento(Integer elemento) {
        this.elemento = elemento;
    }
}
