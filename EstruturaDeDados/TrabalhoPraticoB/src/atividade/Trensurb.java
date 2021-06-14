package atividade;

import java.util.ArrayList;
import java.util.List;

public class Trensurb {

    private Grafo<String> grafo;

    private List<String> listaDeEstacoes;

    public Trensurb() {
        this.grafo = new Grafo<>();
        this.listaDeEstacoes = new ArrayList<>();
    }

    public String buscarEstacaoPeloNome(String nome) {
        return this.listaDeEstacoes.stream()
                .filter(nome::contains)
                .findFirst()
                .orElse(null);
    }

    public void novaEstacao(String nome) {
        this.listaDeEstacoes.add(nome);
        this.grafo.adicionarVertice(nome);
    }

    public void novaLinha(Double distancia, String inicio, String fim) {
        this.grafo.adicionarAresta(distancia, inicio, fim);
    }

    public void verificarEstacoes(String nome) {
        this.grafo.buscaEmLargura(nome);
    }
}
