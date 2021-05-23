package trabalho.model;

import java.util.Scanner;

public class FilaEspera {

    private static final Scanner scanner = new Scanner(System.in);

    private Paciente primeiroDaFila;

    private Integer tamanho;

    public FilaEspera() {
        this.tamanho = 0;
        this.primeiroDaFila = null;
    }

    public boolean estaVazia() {
        return this.tamanho == 0;
    }

    public void entrar() {
        final String nome = peguntarNome();
        final Integer idade = peguntarIdade();
        final EspecialidadeMedica especialidade = peguntarEspecialidade();
        Paciente proximoPaciente = this.primeiroDaFila;
        do {
            if (estaVazia()) {
                this.primeiroDaFila = new Paciente(null, nome, idade, especialidade);
                this.tamanho++;
                break;
            } else if (proximoPaciente.getProximoPaciente() == null) {
                proximoPaciente.setProximoPaciente(new Paciente(null, nome, idade, especialidade));
                this.tamanho++;
                break;
            }
            proximoPaciente = proximoPaciente.getProximoPaciente();
        } while (proximoPaciente != null);
    }

    public Paciente sair() {
        if (!estaVazia()) {
            Paciente antigoPaciente = this.primeiroDaFila;
            this.primeiroDaFila = this.primeiroDaFila.getProximoPaciente();
            this.tamanho--;
            return antigoPaciente;
        }
        return null;
    }

    public void listar() {
        System.out.println("==== LISTAR FILA DE ESPERA ====");
        Paciente proximaPaciente = this.primeiroDaFila;
        while (proximaPaciente != null) {
            System.out.println(proximaPaciente.toString());
            proximaPaciente = proximaPaciente.getProximoPaciente();
        }
        System.out.println("===============================");
    }

    private String peguntarNome() {
        System.out.println("Qual seu nome?");
        return scanner.next();
    }

    private Integer peguntarIdade() {
        System.out.println("Qual sua idade?");
        return scanner.nextInt();
    }

    private EspecialidadeMedica peguntarEspecialidade() {
        System.out.println("Qual especialidade procura?");
        final EspecialidadeMedica[] especialidades = EspecialidadeMedica.values();
        for (int i = 0; i < especialidades.length; i++) {
            System.out.println(String.format("%d - %s", i, especialidades[i].toString()));
        }
        final int posicao = scanner.nextInt();
        return especialidades[posicao];
    }
}
