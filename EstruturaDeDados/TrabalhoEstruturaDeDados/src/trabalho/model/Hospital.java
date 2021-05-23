package trabalho.model;

import java.util.Scanner;

public class Hospital {

    private static final Scanner scanner = new Scanner(System.in);

    private Vaga[] vagas;

    private FilaEspera filaEspera;

    public Hospital(Integer quantidadeVagas) {
        this.vagas = new Vaga[quantidadeVagas];
        this.filaEspera = new FilaEspera();
    }

    public void entrarNaFilaDeEspera() {
        filaEspera.entrar();
        atenderPaciente();
    }

    public void liberarVaga() {
        final Integer posicao = perguntarPosicao();
        vagas[posicao] = null;
        System.out.println("Liberamos a posição: " + posicao);
        atenderPaciente();
    }

    public void listarVagas() {
        System.out.println("==== LISTAR VAGAS ====");
        for (Integer i = 0; i < this.vagas.length; i++) {
            if (vagas[i] == null) {
                System.out.println(i + " - Disponível");
            } else {
                System.out.println(i + " - " + vagas[i].getPaciente().toString());
            }
        }
        System.out.println("======================");
    }

    public void listarFilaDeEspera() {
        this.filaEspera.listar();
    }

    private void atenderPaciente() {
        final Integer posicaoVaga = buscarPosicaoVaga();
        if (posicaoVaga != null && possuiProximoNaFila()) {
            final Paciente paciente = filaEspera.sair();
            vagas[posicaoVaga] = new Vaga(posicaoVaga, paciente);
            System.out.println("Atendemos o paciente " + paciente.getNome());
        } else {
            System.out.println("Não podemos atender pacientes no momento, aguarde ou verifique se possui pacientes na fila");
        }
    }

    private Integer buscarPosicaoVaga() {
        for (Integer i = 0; i < this.vagas.length; i++) {
            if (vagas[i] == null) {
                return i;
            }
        }
        return null;
    }

    private boolean possuiProximoNaFila() {
        return !this.filaEspera.estaVazia();
    }

    private Integer perguntarPosicao() {
        System.out.println("Qual posição deseja liberar?");
        listarVagas();
        return scanner.nextInt();
    }
}
