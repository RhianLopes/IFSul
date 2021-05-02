package atividade;

public class Pilha {

    private int [] elementos;

    private int topo;

    public Pilha(int tamanho) {
        this.elementos = new int [tamanho];
        this.topo = -1;
    }

    public boolean estaVazia() {
        return this.topo == -1;
    }

    public boolean estaCheia() {
        return this.elementos.length -1 == topo;
    }

    public void empilha(int valor) {
        if (!this.estaCheia()) {
            this.topo++;
            this.elementos[this.topo] = valor;
        }
    }

    public int desempilha() {
        if (!this.estaVazia()) {
            int valor = this.elementos[this.topo];
            this.elementos[this.topo] = 0;
            this.topo--;
            return valor;
        }
        return 0;
    }

    public int elementoTopo() {
        return this.elementos[this.topo];
    }

    public void imprime() {
        for (int i = 0; i < this.elementos.length; i++) {
            if (i + 1 == this.elementos.length) {
                System.out.print(String.format(" [%d]: %d \n", i, this.elementos[i]));
            } else {
                System.out.print(String.format(" [%d]: %d ", i, this.elementos[i]));
            }
        }
    }
}
