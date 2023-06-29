import 'Veiculo.dart';

class Estoque {
  List<Veiculo> catalogo = [];

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
}
