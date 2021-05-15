package br.com.ifsul.compubras.controller;

import br.com.ifsul.compubras.dto.PedidoPorClienteDto;
import br.com.ifsul.compubras.dto.MelhorVendedorDto;
import br.com.ifsul.compubras.model.Produto;
import br.com.ifsul.compubras.service.ExercicioServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ExercicioController {

    @Autowired
    private ExercicioServiceImpl clienteService;

    @GetMapping("/pedido-por-cliente")
    public List<PedidoPorClienteDto> pedidoPorCliente() {
        return clienteService.pedidoPorCliente();
    }

    @GetMapping("/melhor-vendedor")
    public List<MelhorVendedorDto> melhorVendedor() {
        return clienteService.melhorVendedor();
    }

    @GetMapping("/produtos-por-filtro")
    public List<Produto> produtosPorFiltro() {
        return clienteService.produtosPorFiltro();
    }
}
