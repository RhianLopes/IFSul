package atividade;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

public class Arvore {

    private Object info;

    private Arvore prim;

    private Arvore prox;

    public Arvore(Object info) {
        this.info = info;
        this.prim = null;
        this.prox = null;
    }

    public static void insere(Arvore a, Arvore sub) {
        sub.setProx(a.getPrim());
        a.setPrim(sub);
    }

    public static void imprime(Arvore a) {
        Arvore atual;
        System.out.println(a.getInfo());
        for (atual = a.getPrim(); atual != null; atual = atual.getProx()) {
            imprime(atual);
        }
    }

    public static boolean pertence(Arvore a, Object obj) {
        Arvore atual;
        if (a.getInfo().equals(obj)) {
            return true;
        } else {
            for (atual = a.getPrim(); atual != null; atual = atual.getProx()) {
                if (pertence(atual, obj)) {
                    return true;
                }
            }
            return false;
        }
    }

    public static void retira(Arvore a, Object obj) {
        Arvore atual;
        if (a.getInfo().equals(obj)) {
            a.setPrim(null);
        } else {
            for (atual = a.getPrim(); atual != null; atual = atual.getProx()) {
                pertence(atual.getProx(), obj);
            }
        }
    }

    public static int calculaAltura(Arvore a) {
        int alturaMaxima = -1;
        Arvore atual;
        for (atual = a.getPrim(); atual != null; atual = atual.getProx()) {
            int altura = calculaAltura(atual);
            if (altura > alturaMaxima) {
                alturaMaxima = altura;
            }
        }
        return alturaMaxima + 1;
    }

    public static int calculaAlturaBinaria(Arvore a) {
        if (isNull(a)) {
            return -1;
        } else {
            return Math.max(1 + calculaAlturaBinaria(a.getPrim()), 1 + calculaAlturaBinaria(a.getProx()));
        }
    }

    public Object getInfo() {
        return info;
    }

    public void setInfo(Object info) {
        this.info = info;
    }

    public Arvore getPrim() {
        return prim;
    }

    public void setPrim(Arvore prim) {
        this.prim = prim;
    }

    public Arvore getProx() {
        return prox;
    }

    public void setProx(Arvore prox) {
        this.prox = prox;
    }
}
