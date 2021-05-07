package atividade;

public class Main {

    private static FilaDinamica filaDinamicaAleatoria = null;
    private static FilaDinamica filaDinamicaPares = null;
    private static FilaDinamica filaDinamicaImpares = null;

    public static void main(String[] args) {

        filaDinamicaAleatoria = new FilaDinamica(" FILA ALEATORIA");
        filaDinamicaPares = new FilaDinamica(" FILA PARES");
        filaDinamicaImpares = new FilaDinamica(" FILA IMPARES");

        filaDinamicaAleatoria.insere(0);
        filaDinamicaAleatoria.insere(1);
        filaDinamicaAleatoria.insere(2);
        filaDinamicaAleatoria.insere(3);
        filaDinamicaAleatoria.insere(4);

        imprimirFilas("INICIO");

        while (!filaDinamicaAleatoria.estaVazia()) {
            final Integer elemento = filaDinamicaAleatoria.retira();
            if (elemento % 2 == 0) {
                filaDinamicaPares.insere(elemento);
            } else {
                filaDinamicaImpares.insere(elemento);
            }
        }

        imprimirFilas("FIM");
    }

    private static void imprimirFilas(String descricao) {
        System.out.println(String.format("#### %s ####\n", descricao));
        filaDinamicaAleatoria.imprime();
        filaDinamicaPares.imprime();
        filaDinamicaImpares.imprime();
        System.out.println("################\n");
    }
}
