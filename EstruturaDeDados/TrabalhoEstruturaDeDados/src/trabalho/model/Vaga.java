package trabalho.model;

public class Vaga {

    private Integer posicao;

    private Paciente paciente;

    public Vaga(Integer posicao, Paciente paciente) {
        this.posicao = posicao;
        this.paciente = paciente;
    }

    public Integer getPosicao() {
        return posicao;
    }

    public void setPosicao(Integer posicao) {
        this.posicao = posicao;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    @Override
    public String toString() {
        return "Vaga{" +
                "posicao=" + posicao +
                ", paciente=" + paciente +
                '}';
    }
}
