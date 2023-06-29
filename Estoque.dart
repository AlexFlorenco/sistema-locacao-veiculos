import 'Veiculo.dart';

class Estoque {
  List<Veiculo> catalogo = [];

  void listarEstoque() {
    if (catalogo.isNotEmpty) {
      for (var veiculo in catalogo) {
        veiculo.exibirVeiculo();
      }
    } else {
      print("Lista vazia");
    }
  }

  void add(Veiculo) {
    catalogo.add(Veiculo);
    print("Veículo adicionado com sucesso!");
  }

  bool del(String placa) {
    for (var veiculo in catalogo) {
      if (veiculo.placa == placa) {
        catalogo.remove(catalogo.indexOf(veiculo));
        return true;
      }
    }
    return false;
  }

  void showAll() {
    for (var veiculo in catalogo) {
      print(
          "${veiculo.marca} ${veiculo.modelo} ${veiculo.anoFabricacao}\nPlaca: ${veiculo.placa}\nDisponível:${veiculo.estaDisponivel}\nDiária:${veiculo.valorDiaria}\n");
    }
  }
}