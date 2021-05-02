package atividade;

public class Pilha {

    private int [] elemento;

    private int topo;

    public Pilha(int tamanho) {
        this.elemento = new int [tamanho];
        this.topo = -1;
    }

    public boolean estaVazia() {
        return this.topo == -1;
    }

    public boolean estaCheia() {
        return this.elemento.length == topo - 1;
    }

    public void empilha(int valor) {
        if (!this.estaCheia()) {
            this.topo++;
            this.elemento[this.topo] = valor;
        }
    }

    public int desempilha() {
        if (!this.estaVazia()) {
            int valor = this.elemento[this.topo];
            this.elemento[this.topo] = 0;
            this.topo--;
            return valor;
        }
        return this.topo;
    }

    public int elementoTopo() {
        return this.elemento[this.topo];
    }

    public void imprime() {
        for (int i = 0; i < this.elemento.length; i++) {
            if (i + 1 == this.elemento.length) {
                System.out.print(String.format(" [%d]: %d \n", i, this.elemento[i]));
            } else {
                System.out.print(String.format(" [%d]: %d ", i, this.elemento[i]));
            }
        }
    }
}
