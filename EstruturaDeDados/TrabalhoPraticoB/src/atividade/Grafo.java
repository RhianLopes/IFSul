package atividade;

import java.util.ArrayList;
import java.util.List;

public class Grafo<Object> {

    private List<Aresta<Object>> arestas;

    private List<Vertice<Object>> vertices;

    public Grafo() {
        this.arestas = new ArrayList<>();
        this.vertices = new ArrayList<>();
    }

    public void adicionarVertice(Object elemento) {
        Vertice<Object> novoVertice = new Vertice<>(elemento);
        this.vertices.add(novoVertice);
    }

    public void adicionarAresta(Double peso, Object elementoInicio, Object elementoFim) {
        Vertice<Object> inicio = this.getVertice(elementoInicio);
        Vertice<Object> fim = this.getVertice(elementoFim);
        Aresta<Object> aresta = new Aresta<>(peso, inicio, fim);
        inicio.adicionarArestaSaida(aresta);
        fim.adicionarArestaEntrada(aresta);
        this.arestas.add(aresta);
    }

    public Vertice<Object> getVertice(Object elemento) {
        Vertice<Object> verticeAtual = null;
        for (int i = 0; i < this.vertices.size(); i++) {
            if (this.vertices.get(i).getElemento().equals(elemento)) {
                verticeAtual = this.vertices.get(i);
                break;
            }
        }
        return verticeAtual;
    }

    public void buscaEmLargura(String nome) {
        List<Vertice<Object>> marcados = new ArrayList<>();
        List<Vertice<Object>> filaPendentes = new ArrayList<>();
        Vertice<Object> atual = buscarVerticeAtual(nome);
        System.out.println(String.format("Sua estação atual é %s", atual.getElemento()));
        marcados.add(atual);
        filaPendentes.add(atual);
        while (filaPendentes.size() > 0) {
            Vertice<Object> visitado = filaPendentes.get(0);
            for (int i = 0; i < visitado.getArestasSaida().size(); i++) {
                Aresta<Object> aresta = visitado.getArestasSaida().get(i);
                Vertice<Object> proximo = aresta.getFim();
                if (!marcados.contains(proximo)) {
                    System.out.println(String.format("%s -- %s Km --> %s", visitado.getElemento(), String.format("%.2f", aresta.getPeso()), proximo.getElemento()));
                    marcados.add(proximo);
                    filaPendentes.add(proximo);
                }
            }
            filaPendentes.remove(0);
        }
    }

    private Vertice<Object> buscarVerticeAtual(String nome) {
        return this.vertices.stream()
                .filter(valor -> valor.getElemento().equals(nome))
                .findFirst()
                .orElse(this.vertices.get(0));
    }

    public List<Aresta<Object>> getArestas() {
        return arestas;
    }

    public void setArestas(List<Aresta<Object>> arestas) {
        this.arestas = arestas;
    }

    public List<Vertice<Object>> getVertices() {
        return vertices;
    }

    public void setVertices(List<Vertice<Object>> vertices) {
        this.vertices = vertices;
    }
}
