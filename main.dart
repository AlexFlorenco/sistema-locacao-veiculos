import 'dart:io';
import 'Veiculo.dart';
import 'Estoque.dart';

var estoque = Estoque();

void main() {
  String? operacao;
  print("""
Selecione uma operação:
    1. Adicionar veículo
    // 2. Remover veículos
    3. Mostrar todos os veículos
    // 4. Mostrar veículos disponíveis
    // 5. Faturamento do Dia
    // 6. Orçamento
    // 7. Orçamento com desconto
    0. Sair
    """);

  while (operacao != "0") {
    stdout.write(">>> ");
    operacao = stdin.readLineSync();

    switch (operacao) {
      case "1":
        print("Adicionar Veículo");
        stdout.write("Placa: ");
        String? placa = stdin.readLineSync();

        stdout.write("Marca: ");
        String? marca = stdin.readLineSync();

        stdout.write("Modelo: ");
        String? modelo = stdin.readLineSync();

        stdout.write("Ano: ");
        String? anoFabricacao = stdin.readLineSync();

        stdout.write("Valor da Diária: ");
        String? valorDiaria = stdin.readLineSync();

        if (placa != null &&
            marca != null &&
            modelo != null &&
            anoFabricacao != null &&
            valorDiaria != null) {
          var veiculo = Veiculo(placa, marca, modelo, anoFabricacao, true,
              double.parse(valorDiaria));
          estoque.add(veiculo);
        }

      case "3":
        print("Todos os Veículos");
        estoque.showAll();

      case "0":
        print("Saindo...");
        break;

      default:
        print("Inválido!");
    }
  }
}
