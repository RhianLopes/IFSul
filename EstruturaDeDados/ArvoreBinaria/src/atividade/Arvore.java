package atividade;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

public class Arvore {

    private Object info;

    private Arvore esquerda;

    private Arvore direita;

    public Arvore(Object info, Arvore esquerda, Arvore direita) {
        this.info = info;
        this.esquerda = esquerda;
        this.direita = direita;
    }

    public Arvore() {
    }

    public static boolean estaVazia(Arvore a) {
        return isNull(a);
    }

    public static boolean pertence(Arvore a, Object obj) {
        if (estaVazia(a)) {
            return false;
        }
        return a.info.equals(obj) || pertence(a.esquerda, obj) || pertence(a.direita, obj);
    }

    public static void imprimir(Arvore a) {
        if (!estaVazia(a)) {
            System.out.println(a.info);
            imprimir(a.esquerda);
            imprimir(a.direita);
        }
    }

    public static int quantidadeDeNos(Arvore a) {
        if (estaVazia(a)) {
            return 0;
        }
        return quantidadeDeNos(a.esquerda) + quantidadeDeNos(a.direita) + 1;
    }

    public static int altura(Arvore a) {
        if (estaVazia(a)) {
            return 0;
        }
        return Math.max(altura(a.esquerda), altura(a.direita)) + 1;
    }

    public Object getInfo() {
        return info;
    }

    public void setInfo(Object info) {
        this.info = info;
    }

    public Arvore getEsquerda() {
        return esquerda;
    }

    public void setEsquerda(Arvore esquerda) {
        this.esquerda = esquerda;
    }

    public Arvore getDireita() {
        return direita;
    }

    public void setDireita(Arvore direita) {
        this.direita = direita;
    }
}
