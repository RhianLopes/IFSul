package trabalho;

import trabalho.model.Hospital;

import java.util.Scanner;

public class Main {

    private static final Scanner scanner = new Scanner(System.in);


    public static void main(String[] args) {
        System.out.println("Quantas vagas o hospital deve ter?");
        final Hospital hospital = new Hospital(scanner.nextInt());

        while (true) {
            System.out.println("========== MENU =============");
            System.out.println("1 - Entrar na fila de espera");
            System.out.println("2 - Listar fila de espera");
            System.out.println("3 - Listar vagas");
            System.out.println("4 - Liberar vaga");
            System.out.println("=============================");
            final Integer decisao = scanner.nextInt();
            switch (decisao) {
                case 1:
                    hospital.entrarNaFilaDeEspera();
                    break;
                case 2:
                    hospital.listarFilaDeEspera();
                    break;
                case 3:
                    hospital.listarVagas();
                    break;
                case 4:
                    hospital.liberarVaga();
                    break;
                default:
                    System.out.println("Não conseguimos encontrar a opção selecionada, tente novamente");
                    break;
            }
        }
    }
}
