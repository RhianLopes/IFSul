package atividade;

public class Main {

    public static void main(String[] args) {
        final Pilha pilha1 = new Pilha(5);
        final Pilha pilha2 = new Pilha(5);
        final Pilha pilha3 = new Pilha(5);

        pilha1.empilha(2);
        pilha1.empilha(5);
        pilha1.empilha(8);
        pilha1.empilha(7);
        pilha1.empilha(1);

        imprimirFilas(pilha1, pilha2, pilha3, "Filas iniciais");

        pilha2.empilha(pilha1.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 1 vai para fila 2, elemento 1");

        pilha3.empilha(pilha2.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 2 vai para fila 3, elemento 1");

        pilha2.empilha(pilha1.desempilha());
        pilha2.empilha(pilha1.desempilha());
        pilha2.empilha(pilha1.desempilha());
        pilha2.empilha(pilha1.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Todos os elementos da pila 1 vão para fila 2, para ter acesso ao 2, próximo elemento em ordem crescente");

        pilha3.empilha(pilha2.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 2 vai para fila 3, elemento 2");

        pilha3.empilha(pilha2.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 2 vai para fila 3, elemento 5");

        pilha1.empilha(pilha2.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 2 vai para fila 1, elemento 8");

        pilha3.empilha(pilha2.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 2 vai para fila 3, elemento 7");

        pilha2.empilha(pilha1.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 1 vai para fila 2, elemento 8");

        pilha3.empilha(pilha2.desempilha());

        imprimirFilas(pilha1, pilha2, pilha3, "Topo da fila 2 vai para fila 3, elemento 8");
    }

    private static void imprimirFilas(Pilha pilha1, Pilha pilha2, Pilha pilha3, String descricao) {
        System.out.println(String.format("-----------------------------> %s \n", descricao));
        System.out.print("Pilha 1 = ");
        pilha1.imprime();
        System.out.print("Pilha 2 = ");
        pilha2.imprime();
        System.out.print("Pilha 3 = ");
        pilha3.imprime();
        System.out.println();
    }
}
