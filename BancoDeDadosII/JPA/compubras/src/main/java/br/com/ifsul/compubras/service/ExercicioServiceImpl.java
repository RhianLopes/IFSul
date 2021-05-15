package br.com.ifsul.compubras.service;

import br.com.ifsul.compubras.dto.PedidoPorClienteDto;
import br.com.ifsul.compubras.dto.MelhorVendedorDto;
import br.com.ifsul.compubras.model.Produto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class ExercicioServiceImpl {

    @Autowired
    private EntityManager entityManager;

    //    3) Ver os pedidos de cada cliente, listando nome do cliente e número do pedido. (codpedido asc,
    //    codcliente asc)
    //    Linhas: 8432
    public List<PedidoPorClienteDto> pedidoPorCliente() {
        String query = "SELECT " +
                " NEW br.com.ifsul.compubras.dto.PedidoPorClienteDto(" +
                "   c.codCliente," +
                "   c.nome," +
                "   p.codPedido) " +
                " FROM Pedido p" +
                " INNER JOIN p.cliente c" +
                " ORDER BY p.codPedido ASC, c.codCliente ASC";
        TypedQuery<PedidoPorClienteDto> typedQuery = entityManager.createQuery(query, PedidoPorClienteDto.class);
        return typedQuery.getResultList();
    }

    //    14) Liste os produtos, do mais caro para o mais barato, dos pedidos no mês de junho (considerando
    //    todos os anos)
    //    Linhas: 871
    public List<Produto> produtosPorFiltro() {
        String query = "SELECT " +
                "   pr " +
                " FROM ItemPedido ip" +
                " INNER JOIN ip.produto pr" +
                " INNER JOIN ip.pedido p " +
                " WHERE MONTH(p.dataPedido) = 6 " +
                " GROUP BY pr.codProduto " +
                " ORDER BY pr.valorUnitario DESC ";
        TypedQuery<Produto> typedQuery = entityManager.createQuery(query, Produto.class);
        return typedQuery.getResultList();
    }

    //    16) Exiba a relação com os melhores vendedores (considerando apenas a quantidade
    //    de pedidos) para o mês de setembro (incluindo todos os anos). Exiba o nome do
    //    vendedor, o ano e o número total de pedidos daquele ano. (ano desc, pedidos desc, nome asc)
    //    Linhas: 435
    public List<MelhorVendedorDto> melhorVendedor() {
        String query = "SELECT " +
                " NEW br.com.ifsul.compubras.dto.MelhorVendedorDto(v.nome, YEAR(p.dataPedido), COUNT(p)) " +
                " FROM Pedido p " +
                " JOIN p.vendedor v " +
                " WHERE MONTH(p.dataPedido) = 9 " +
                " GROUP BY v.codVendedor, YEAR(p.dataPedido) " +
                " ORDER BY YEAR(p.dataPedido) DESC, COUNT(p) DESC, v.nome ASC";
        TypedQuery<MelhorVendedorDto> typedQuery = entityManager.createQuery(query, MelhorVendedorDto.class);
        return typedQuery.getResultList();
    }
}
