import 'dart:io';
import 'Veiculo.dart';
import 'Estoque.dart';

var estoque = Estoque();

void main() {
  String? operacao;
  print("""
\nSELECIONE UMA OPERAÇÂO:
  1. Adicionar veículo
  2. Remover veículo
  3. Mostrar todos os veículos
  // 4. Mostrar veículos disponíveis
  // 5. Faturamento do Dia
  // 6. Orçamento
  // 7. Orçamento com desconto
  0. Sair""");

  while (operacao != "0") {
    stdout.write("\n>>> ");
    operacao = stdin.readLineSync();

    switch (operacao) {
      case "1":
        print("\nADICIONAR VEÍCULO:");
        stdout.write("Placa: ");
        var placa = stdin.readLineSync();

        stdout.write("Marca: ");
        var marca = stdin.readLineSync();

        stdout.write("Modelo: ");
        var modelo = stdin.readLineSync();

        stdout.write("Ano: ");
        var anoFabricacao = stdin.readLineSync();

        stdout.write("Valor da Diária: ");
        var valorDiaria = stdin.readLineSync();

        if (placa != null &&
            marca != null &&
            modelo != null &&
            anoFabricacao != null &&
            valorDiaria != null) {
          if (placa != "" &&
              marca != "" &&
              modelo != "" &&
              anoFabricacao != "" &&
              valorDiaria != "") {
            estoque.add(Veiculo(placa, marca, modelo, anoFabricacao, true,
                double.parse(valorDiaria)));
            print("VEÍCULO ADICIONADO!");
          } else {
            print("ERRO: TODAS INFORMAÇÕES DEVEM SER PREENCHIDAS!");
          }
        }
      case "2":
        print("\nREMOVER VEÍCULO");
        stdout.write("Placa: ");
        String? veiculoASerRemovido = stdin.readLineSync();

        if (veiculoASerRemovido != null) {
          if (estoque.del(veiculoASerRemovido)) {
            print("VEÍCULO REMOVIDO!");
          } else {
            print("ERRO: VEÍCULO NÃO ENCONTRADO!");
          }
        } else {
          print("ERRO: INFORMAÇÃO INVÁLIDA!");
        }

      case "3":
        print("\nLISTAR VEÍCULOS");
        if (!estoque.showAll()) {
          print("ESTOQUE VAZIO!");
        }

      case "0":
        print("Saindo...");
        break;

      default:
        print("OPERAÇÃO INVÁLIDA!");
    }
  }
}
