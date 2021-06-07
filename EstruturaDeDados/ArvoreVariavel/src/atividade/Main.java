package atividade;

public class Main {

    public static void main(String[] args) {
        Arvore raiz = new Arvore("a");
        Arvore b = new Arvore("b");
        Arvore c = new Arvore("c");
        Arvore d = new Arvore("d");
        Arvore e = new Arvore("e");
        Arvore f = new Arvore("f");
        Arvore g = new Arvore("g");
        Arvore h = new Arvore("h");
        Arvore i = new Arvore("i");
        Arvore j = new Arvore("j");

        Arvore.insere(c, d);
        Arvore.insere(b, e);
        Arvore.insere(b, c);
        Arvore.insere(i, j);
        Arvore.insere(g, i);
        Arvore.insere(g, h);
        Arvore.insere(raiz, g);
        Arvore.insere(raiz, f);
        Arvore.insere(raiz, b);

        System.out.println("Criar árvore variável");
        System.out.println("Altura: " + Arvore.calculaAltura(raiz));
        System.out.println("Altura Binaria: " + Arvore.calculaAlturaBinaria(raiz));
        Arvore.imprime(raiz);

        Arvore k = new Arvore("k");
        Arvore.insere(g, k);

        System.out.println("Adiciona árvore k");
        System.out.println("Altura: " + Arvore.calculaAltura(raiz));
        System.out.println("Altura Binaria: " + Arvore.calculaAlturaBinaria(raiz));
        System.out.println("k pertence a árvore? " + Arvore.pertence(raiz, k.getInfo()));
        Arvore.imprime(raiz);

        Arvore.retira(raiz, 'k');
        System.out.println("Remove árvore k");
        System.out.println("Altura: " + Arvore.calculaAltura(raiz));
        System.out.println("Altura Binaria: " + Arvore.calculaAlturaBinaria(raiz));
        System.out.println("k pertence a árvore? " + Arvore.pertence(raiz, k.getInfo()));
        Arvore.imprime(raiz);
    }
}
