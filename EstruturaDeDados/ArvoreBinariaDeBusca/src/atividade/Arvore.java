package atividade;

import java.util.Objects;

import static java.util.Objects.*;

public class Arvore {

    private int info;

    private Arvore esquerda;

    private Arvore direita;

    public Arvore() {
    }

    public Arvore(int info, Arvore esquerda, Arvore direita) {
        this.info = info;
        this.esquerda = esquerda;
        this.direita = direita;
    }

    public static boolean estaVazia(Arvore arvore) {
        return isNull(arvore);
    }

    public static void imprimir(Arvore arvore) {
        if (!estaVazia(arvore)) {
            imprimir(arvore.esquerda);
            System.out.println(arvore.info);
            imprimir(arvore.direita);
        }
    }

    public static Arvore busca(Arvore arvore, int obj) {
        if (estaVazia(arvore)) {
            return null;
        }

        if (arvore.info > obj) {
            return busca(arvore.esquerda, obj);
        } else if (arvore.info < obj) {
            return busca(arvore.direita, obj);
        } else {
            return arvore;
        }
    }

    public static Arvore insere(Arvore arvore, int obj) {
        if (estaVazia(arvore)) {
            arvore = new Arvore(obj, null, null);
        } else if (arvore.info > obj) {
            arvore.setEsquerda(insere(arvore.getEsquerda(), obj));
        } else {
            arvore.setDireita(insere(arvore.getDireita(), obj));
        }
        return arvore;
    }

    public static Arvore retira(Arvore arvore, int obj) {
        if (estaVazia(arvore)) {
            return null;
        } else if (arvore.getInfo() > obj) {
            arvore.setEsquerda(retira(arvore.getEsquerda(), obj));
        } else if (arvore.getInfo() < obj) {
            arvore.setDireita(retira(arvore.getDireita(), obj));
        } else {
            if (isNull(arvore.getEsquerda()) && isNull(arvore.getDireita())) {
                arvore = null;
            } else if (isNull(arvore.getEsquerda())) {
                arvore = arvore.getDireita();
            } else if (isNull(arvore.getDireita())) {
                arvore = arvore.getEsquerda();
            } else {
                Arvore novaArvore = arvore.getEsquerda();
                while (nonNull(novaArvore.getDireita())) {
                    novaArvore = novaArvore.getDireita();
                }
                arvore.setInfo(novaArvore.getInfo());
                novaArvore.setInfo(obj);
                arvore.setEsquerda(retira(arvore.getEsquerda(), obj));
            }
        }
        return arvore;
    }

    public static void balancear(Arvore arvore) {
        if (!estaVazia(arvore)) {
            int quantidadeNosEsquerda = quantidadeDeNos(arvore.getEsquerda());
            int quantidadeNosDireita = quantidadeDeNos(arvore.getDireita());
            if (quantidadeNosDireita >= quantidadeNosEsquerda + 2) {
                Arvore r = Arvore.retira(arvore, arvore.getInfo());
                Arvore.insere(arvore.getEsquerda(), r.getInfo());
//                Arvore.insere(arvore, arvore.getDireita().getInfo());
                balancear(arvore.getEsquerda());
            } else if (quantidadeNosEsquerda >= quantidadeNosDireita + 2) {
                Arvore r = Arvore.retira(arvore, arvore.getInfo());
                Arvore.insere(arvore.getDireita(), r.getInfo());
//                Arvore.insere(arvore, arvore.getEsquerda().getInfo());
                balancear(arvore.getEsquerda());
            }
        }
    }

    public static int quantidadeDeNos(Arvore a) {
        if (estaVazia(a)) {
            return 0;
        }
        return quantidadeDeNos(a.esquerda) + quantidadeDeNos(a.direita) + 1;
    }

    public int getInfo() {
        return info;
    }

    public void setInfo(int info) {
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
