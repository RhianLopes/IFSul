# Quem sou eu? - Trabalho de Língua Portuguesa e Literatura 

**Nome:** Rhian Lopes da Costa

**Turma:** 3K

### Contexto 🧬

Na aula do dia 20/02/2020 a professora Suzana Trevizan nos solicitou um texto, com o objetivo de falar quem sou eu... 
De uma forma criativa, sendo uma música, poema, etc... Sendo dessa forma, resolvi fazer de uma forma um pouco diferente, 
a ideia é que meu texto seja um trecho de código escrito na linguagem java, irei também escrever abaixo um texto explicando 
as partes do código, de maneira clara e simples. Segue o código escrito abaixo.

### Código 💻
```java
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

public class Main {
  public static void main(String[] args) {
  
      final HashMap<Integer, List<String>> memoria = new HashMap<>();

      final int meuAnoDeNascimento = LocalDate.of(2002, 11, 19).getYear();

      final int meusAnosDeVida = LocalDate.now().getYear() - meuAnoDeNascimento;

      for (Integer idade = 0; idade <= meusAnosDeVida; idade++) {

          if (idade == 1) {
              memoria.put(idade, Collections.singletonList("Minha super festa de 1 aninho"));
          }
          if (idade == 5) {
              memoria.put(idade, Collections.singletonList("Aprendi a andar de bicicleta"));
          }
          if (idade == 9) {
              memoria.put(idade, Collections.singletonList("Me mudei pela primeira vez, para passo fundo"));
          }

          if (idade == 12) {

              memoria.put(idade, Arrays.asList(
                  "primeira ilusão do amor ;-;",
                  "Me mudo para Bom Retiro do Sul"));
          }
          if (idade == 14) {
              memoria.put(idade, Collections.singletonList("Sim... novamente me mudo, agora para POA"));
          }
          if (idade == 15) {
              memoria.put(idade, Arrays.asList(
                  "Fui medalhista na OBMEP :D",
                  "Bolsista pelo Cnpq",
                  "Curso de Matemática Pura e Aplicada na UFRGS",
                  "Entrei no IFSUL :D"));
          }
          if (idade == 16) {
              memoria.put(idade, Arrays.asList(
                  "Estágiario na CWI Software",
                  "Contratado!!! @-@, agora aguentar a rotina!"));
          }

          //TODO: Continuar atualizando esse código nos próximos anos ;D
      }
      System.out.println("###### MINHAS MEMORIAS #######");
      System.out.println(memoria);
  }
}
```

### Explicação sobre o código

Agora irei dar um explicação simples sobre o código, de maneira clara e resumida. Na primeira parte, temos a seguinte estrutura, 
onde ela é a estrutura base do código, permitindo assim que executemos o mesmo. Logo, ela não faz parte em si do resultado final, 
apenas pertencendo a uma estrutura necessária para que o código funcione.

```java
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

public class Main {
  public static void main(String[] args) {
  
  }
}
```

Nas primeiras três linhas, temos as variáveis ```memoria```, ```meuAnoDeNascimento``` e ```meusAnosDeVida```. Os seus nomes são 
auto-explicativos. Logo, a ```memoria``` é uma lista agrupada pela idade, sendo assim, a responsável por guardar as informações em 
formato de texto e a imagem. ```meuAnoDeNascimento``` é o ano em que eu nasci, então peguei apenas o ano da data em que eu nasci e 
por fim, ```meusAnosDeVida``` que é a minha idade atual, para conseguir isso, fiz o ano atual menos o ano da minha idade.

```java
  final HashMap<Integer, List<String>> memoria = new HashMap<>();

  final int meuAnoDeNascimento = LocalDate.of(2002, 11, 19).getYear();

  final int meusAnosDeVida = LocalDate.now().getYear() - meuAnoDeNascimento;
```

Logo abaixo, encontramos um ```for``` que é basicamente o início de um loop, nesse caso, o loop começa na ```idade``` zero, a 
idade deve ser menor ou igual aos meus anos de vida ```idade <= meusAnosDeVida``` e por fim, a cada fim de ciclo, deve ser aumentado 
em 1 a idade ```idade++```. Logo essa é a estrutura do ```for```, nesse caso a variável idade vai começar em 0, e a cada fim de ciclo, 
ela vai ser aumentada em ```+1```, ou seja, ```0, 1, 2, 3... 16, 17``` por exemplo.

```java
for (Integer idade = 0; idade <= meusAnosDeVida; idade++) {

}
```

Dentro de nosso ```for```, temos vários ```if```, como seu próprio nome diz, o ```if``` é uma condição. No caso ```if (idade == 12)```, 
se a idade for igual a 12, ele irá adicionar na memória a idade e duas memórias em formato de texto. Isso se repete várias vezes, 
mudando apenas a idade da condição, podendo ser 1, 2, 5, 16, etc... E como estamos em um Loop que percorre as idades de 0, 1, 2... 3, 
etc... Passaremos por todas as idades que já passei, e por fim, adicionando na ```memoria```.


```java
if (idade == 12) {

  memoria.put(idade, Arrays.asList(
    "primeira ilusão do amor ;-;",
    "Me mudo para Bom Retiro do Sul"));
}
```

Por fim, mas não menos importante, temos dois métodos que irão mostrar como resultado, um título e todas as memórias, resultando 
o nosso resultado do código.

```java
System.out.println("###### MINHAS MEMORIAS #######");
System.out.println(memoria);
```

### Resultado do Código 🔥
```java
###### MINHAS MEMORIAS #######
{
  1=[Minha super festa de 1 aninho],
  5=[Aprendi a andar de bicicleta],
  9=[Me mudei pela primeira vez, para passo fundo],
  12=[
    primeira ilusão do amor ;-;,
    Me mudo para Bom Retiro do Sul
  ],
  14=[Sim... novamente me mudo, agora para POA],
  15=[
    Fui medalhista na OBMEP :D, 
    Bolsista pelo Cnpq,
    Curso de Matemática Pura e Aplicada na UFRGS,
    Entrei no IFSUL :D
  ],
  16=[
    Estágiario na CWI Software, Contratado!!! @-@,
    agora aguentar a rotina!
  ]
}
```

### Conclusão 🔭

Por fim, creio que sou uma junção de experiências que deram certo as vezes, e outras vezes não, em diversas idades... Sendo assim, aberto 
a diversas outras coisas que podem vir ou poderão acontecer com o decorrer dos anos, espero que tenha sido um texto/código criativo para 
representar quem sou eu.
