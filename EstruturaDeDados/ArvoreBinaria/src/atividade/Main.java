package atividade;

public class Main {

    public static void main(String[] args) {

        // Criando árvore
        Arvore raiz = new Arvore('a',
                new Arvore('b', null, new Arvore('d', null, null)),
                new Arvore('c',
                        new Arvore('e', null, null),
                        new Arvore('f', null, null)
                )
        );
        System.out.println("1. Criando árvore");
        System.out.println("Quantidade de nós: " + Arvore.quantidadeDeNos(raiz));
        System.out.println("Altura da árvore: " + Arvore.altura(raiz));
        Arvore.imprimir(raiz);

        // Adicionando galho x no lado esquerdo do galho b
        Arvore novoGalho = new Arvore('x',
                new Arvore('y', null, null),
                new Arvore('z', null, null)
        );

        raiz.getEsquerda().setEsquerda(novoGalho);

        System.out.println("2. Adicionando galho x no lado esquerdo do galho b");
        System.out.println("Quantidade de nós: " + Arvore.quantidadeDeNos(raiz));
        System.out.println("Altura da árvore: " + Arvore.altura(raiz));
        System.out.println("x pertence a árvore? " + Arvore.pertence(raiz, 'x'));
        System.out.println("y pertence a árvore? " + Arvore.pertence(raiz, 'y'));
        System.out.println("z pertence a árvore? " + Arvore.pertence(raiz, 'z'));
        Arvore.imprimir(raiz);

        // Removendo árvore e no galho c
        raiz.getDireita().setEsquerda(null);

        System.out.println("3. Removendo árvore e no galho c");
        System.out.println("Quantidade de nós: " + Arvore.quantidadeDeNos(raiz));
        System.out.println("Altura da árvore: " + Arvore.altura(raiz));
        System.out.println("c ainda pertence a árvore? " + Arvore.pertence(raiz, 'e'));
        Arvore.imprimir(raiz);
    }
}
