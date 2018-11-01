package br.com.crashsolutions.Acoes;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import br.com.crashsolutions.SG.ProdutoSG;

public class Carrinho {
	
	private ArrayList<ProdutoSG> lista = new ArrayList<>();
	public boolean encontrado;
	HttpSession session;
	
	public ArrayList<ProdutoSG> AdicionarCarrinho(ProdutoSG sgproduto) throws IOException, ServletException {
		
		try {
			sgproduto.getIdproduto();
			sgproduto.getProduto();
			sgproduto.getTamanho();
			sgproduto.getCor();
			sgproduto.getCategoria();
			sgproduto.getQuantidade();
			sgproduto.getValor_custo();
			lista.add(sgproduto);
			
		} catch (Exception e) {
			System.out.println("N�o foi poss�vel adicionar a tabela.  " + e);
			return null;
		}
		return lista;
		
	}
	
	public ArrayList<ProdutoSG> AlterarCarrinho(ProdutoSG sgproduto) {
		
		for(ProdutoSG sg: lista) {
			if(sg.getIdproduto() == sgproduto.getIdproduto()) {
				int quant = sg.getQuantidade() + sgproduto.getQuantidade();
				sg.setQuantidade(quant);
				lista.set(lista.indexOf(sg), sg);
			}
		}
		
		return lista;
	}
	
	public ArrayList<ProdutoSG> MostrarCarrinho() {
		
		ArrayList<ProdutoSG> mostrarcarrinho = new ArrayList<>();
		
		try {
			
			for(ProdutoSG sg: lista) {
				
				sg.getIdproduto();
				sg.getProduto();
				sg.getTamanho();
				sg.getCor();
				sg.getCategoria();
				sg.getQuantidade();
				sg.getValor_custo();
				mostrarcarrinho.add(sg);
				
			}
			
		} catch (Exception e) {
			System.out.println("N�o foi poss�vel mostrar a tabela. " + e);
			return null;
		}
		
		return mostrarcarrinho;
	}
	
	public ArrayList<ProdutoSG> DeletarCarrinho(Integer idproduto) {
		
		for(int i = 0; i < lista.size(); i++) {	
			if(lista.get(i).getIdproduto() == idproduto) {
				lista.remove(lista.get(i));
			}
		}
		
		return lista;
	}
	
	public boolean ProcurarnoCarrinho(int idproduto, String tamanho) {
	
		if(!lista.isEmpty()) {
			for(ProdutoSG sg: lista) {	
				if((sg.getIdproduto().equals(idproduto)) && (sg.getTamanho().equals(tamanho))) {
					encontrado = true;
				} else {
					encontrado = false;
				}
			}
		} else {
			encontrado = false;
		}
		
		return encontrado;
	}
}