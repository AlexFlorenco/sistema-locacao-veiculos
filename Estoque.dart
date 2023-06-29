import 'Veiculo.dart';

class Estoque {
  List<Veiculo> catalogo = [
    Veiculo("HXU-6879", "FORD", "FIESTA", "2010", false, 75.00),
    Veiculo("PUR-4462", "VOLKSWAGEM", "VOYAGE", "2015", true, 120.00)
  ];

  bool add(Veiculo) {
    catalogo.add(Veiculo);
    return true;
  }

  bool del(String placa) {
    for (var veiculo in catalogo) {
      if (veiculo.placa == placa) {
        catalogo.removeAt(catalogo.indexOf(veiculo));
        return true;
      }
    }
    return false;
  }

  bool showAll() {
    if (catalogo.isNotEmpty) {
      for (var veiculo in catalogo) {
        veiculo.exibirInformacoesVeiculo();
      }
      return true;
    }
    return false;
  }

  bool showDisponiveis() {
    if (catalogo.isNotEmpty) {
      for (var veiculo in catalogo) {
        if (veiculo.estaDisponivel) veiculo.exibirInformacoesVeiculo();
      }
      return true;
    }
    return false;
  }

  double faturamentoDia() {
    double faturamento = 0;
    if (catalogo.isNotEmpty) {
      for (var veiculo in catalogo) {
        if (!veiculo.estaDisponivel) {
          faturamento += veiculo.valorDiaria;
        }
      }
    }
    return faturamento;
  }

  double orcamento(String placa, int diasLocacao) {
    for (var veiculo in catalogo) {
      if (veiculo.placa == placa) {
        return veiculo.valorDiaria * diasLocacao;
      }
    }
    return 0;
  }

  double orcamentoDesconto(String placa, int diasLocacao, double desconto) {
    for (var veiculo in catalogo) {
      if (veiculo.placa == placa) {
        return (1 - desconto / 100) * (veiculo.valorDiaria * diasLocacao);
      }
    }
    return 0;
  }

  bool locar(String placa) {
    for (var veiculo in catalogo) {
      if (veiculo.placa == placa) {
        veiculo.estaDisponivel = false;
        return true;
      }
    }
    return false;
  }
}
