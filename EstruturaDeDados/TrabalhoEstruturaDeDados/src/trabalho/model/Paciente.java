package trabalho.model;

public class Paciente {

    private Paciente proximoPaciente;

    private String nome;

    private Integer idade;

    private EspecialidadeMedica especialidadeMedica;

    public Paciente(Paciente proximoPaciente, String nome, Integer idade, EspecialidadeMedica especialidadeMedica) {
        this.proximoPaciente = proximoPaciente;
        this.nome = nome;
        this.idade = idade;
        this.especialidadeMedica = especialidadeMedica;
    }

    public Paciente getProximoPaciente() {
        return proximoPaciente;
    }

    public void setProximoPaciente(Paciente proximoPaciente) {
        this.proximoPaciente = proximoPaciente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }

    public EspecialidadeMedica getEspecialidadeMedica() {
        return especialidadeMedica;
    }

    public void setEspecialidadeMedica(EspecialidadeMedica especialidadeMedica) {
        this.especialidadeMedica = especialidadeMedica;
    }
}
