package atividade;

import java.util.Objects;
import java.util.Scanner;

public class Main {

    private static final Scanner scanner = new Scanner(System.in);
    private static final Trensurb trensurb = new Trensurb();

    public static void main(String[] args) {
        System.out.println("### Bem-vindo(a) ao nosso simulador de Trensurb ###");
        while (true) {
            System.out.println("== MENU =========================================");
            System.out.println("1 - Adicionar nova estação");
            System.out.println("2 - Adicionar linha de trem entre estações");
            System.out.println("3 - Verificar estações que você pode ir");
            System.out.println("=================================================");
            final Integer opcao = scanner.nextInt();
            switch (opcao) {
                case 1:
                    novaEstacao();
                    break;
                case 2:
                    novaLinha();
                    break;
                case 3:
                    verificarEstacoes();
                    break;
                default:
                    System.out.println("Não foi possível encontrar esta opção, tente novamente");
            }
        }

//        grafo.adicionarVertice("Thor"); Rhian
//        grafo.adicionarVertice("Capitão América"); Eduarda
//        grafo.adicionarVertice("Viúva Negra"); Marta
//        grafo.adicionarVertice("Hulk"); Fernando
//        grafo.adicionarVertice("Homem de Ferro"); Ronaldo
//
//        grafo.adicionarAresta(2.0, "Thor", "Capitão América");
//        grafo.adicionarAresta(2.0, "Capitão América", "Hulk");
//        grafo.adicionarAresta(2.0, "Hulk", "Viúva Negra");
//        grafo.adicionarAresta(2.0, "Thor", "Viúva Negra");
//        grafo.adicionarAresta(2.0, "Homem de Ferro", "Capitão América");
//        grafo.adicionarAresta(2.0, "Homem de Ferro", "Thor");
//
//        grafo.buscaEmLargura();
    }

    public static void novaEstacao() {
        System.out.println("Informe o nome da nova estação");
        String nome = scanner.next();
        trensurb.novaEstacao(nome);
        System.out.println(String.format("A nova estação %s foi criada!", nome));
    }

    public static void novaLinha() {
        System.out.println("Informe o nome da estação de início");
        String inicio = nomeEstacao();
        System.out.println("Informe o nome da estação de fim");
        String fim = nomeEstacao();
        System.out.println("Informe a distancia (Km) entre elas");
        Double distancia = scanner.nextDouble();
        trensurb.novaLinha(distancia, inicio, fim);
        System.out.println("Nova linha criada com sucesso!");
    }

    public static void verificarEstacoes() {
        System.out.println("Informe o nome da estação atual");
        String nome = nomeEstacao();
        trensurb.verificarEstacoes(nome);
        System.out.println("Lista de possíveis caminhos a seguir");
    }

    private static String nomeEstacao() {
        String nome = null;
        while (Objects.isNull(nome)) {
            String nomeInformado = scanner.next();
            if (nomeInformado.equals(trensurb.buscarEstacaoPeloNome(nomeInformado))) {
                nome = nomeInformado;
            } else {
                System.out.println("Não encontramos nenhuma estação com o nome informado, tente novamente: ");
            }
        }
        return nome;
    }
}
