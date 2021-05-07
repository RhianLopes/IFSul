package atividade;

public class FilaDinamica {

    private Celula inicio;

    private String descricao;

    public FilaDinamica(String descricao) {
        this.inicio = null;
        this.descricao = descricao;
    }

    public boolean estaVazia() {
        return inicio == null;
    }

    public void insere(Integer elemento) {
        Celula proximaCelula = inicio;
        do {
            if (estaVazia()) {
                inicio = new Celula(null, elemento);
                break;
            } else if (proximaCelula.getProxima() == null) {
                proximaCelula.setProxima(new Celula(null, elemento));
                break;
            }
            proximaCelula = proximaCelula.getProxima();
        } while (proximaCelula != null);
    }

    public Integer retira() {
        if (!estaVazia()) {
            Celula antigoInicio = inicio;
            inicio = antigoInicio.getProxima();
            return antigoInicio.getElemento();
        }
        return null;
    }

    public void imprime() {
        System.out.println(String.format("---- %s ----", descricao));
        Celula proximaCelula = inicio;
        while (proximaCelula != null) {
            System.out.println(proximaCelula.getElemento());
            proximaCelula = proximaCelula.getProxima();
        }
        System.out.println("-----------------------\n");
    }
}
