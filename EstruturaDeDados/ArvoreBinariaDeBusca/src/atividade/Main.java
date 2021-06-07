package atividade;

public class Main {

    public static void main(String[] args) {
        Arvore raiz = new Arvore(6,
                new Arvore(2,
                        new Arvore(1, null, null),
                        new Arvore(4,
                                new Arvore(3, null, null),
                                null)),
                new Arvore(8, null, null)
        );

        System.out.println("=== Arvore Inicial ===");
        Arvore.imprimir(raiz);

        System.out.println("=== Buscar Árvore 8 ===");
        Arvore.imprimir(Arvore.busca(raiz, 8));

        System.out.println("=== Buscar Árvore 2 ===");
        Arvore.imprimir(Arvore.busca(raiz, 2));

        System.out.println("=== Buscar Árvore 4 ===");
        Arvore.imprimir(Arvore.busca(raiz, 4));

        System.out.println("=== Retirar Nó 3 ===");
        Arvore.retira(raiz, 3);
        Arvore.imprimir(raiz);
        raiz = new Arvore(6,
                new Arvore(2,
                        new Arvore(1, null, null),
                        new Arvore(4,
                                new Arvore(3, null, null),
                                null)),
                new Arvore(8, null, null)
        );

        System.out.println("=== Retirar Nó 4 ===");
        Arvore.retira(raiz, 4);
        Arvore.imprimir(raiz);

        System.out.println("=== Troca Nó 6 com Nó 4 ===");
        Arvore novaRaiz = new Arvore(4,
                new Arvore(2,
                        new Arvore(1, null, null),
                        new Arvore(6,
                                new Arvore(3, null, null),
                                null)),
                new Arvore(8, null, null)
        );
        Arvore.imprimir(novaRaiz);

        System.out.println("=== Retira Nó 6 ===");
        Arvore.retira(novaRaiz, 6);
        Arvore.imprimir(novaRaiz);

        System.out.println("=== Tentativa de balanceamento :P ===");
        Arvore raizParaBalancear = new Arvore(6,
                new Arvore(2,
                        new Arvore(1, null, null),
                        new Arvore(4,
                                new Arvore(3, null, null),
                                null)),
                new Arvore(8, null, null)
        );
        Arvore.balancear(raizParaBalancear);
        Arvore.imprimir(raizParaBalancear);
    }
}
