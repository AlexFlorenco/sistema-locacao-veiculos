import 'dart:async';
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
  4. Mostrar veículos disponíveis
  5. Faturamento do Dia
  6. Orçamento
  7. Orçamento com desconto
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

      case "4":
        print("VEÍCULOS DISPONÍVEIS");
        if (!estoque.showDisponiveis()) {
          print("ESTOQUE VAZIO!");
        }

      case "5":
        print("FATURAMENTO DO DIA");
        print(estoque.faturamentoDia());

      case "6":
        print("ORÇAMENTO");
        stdout.write("Placa: ");
        String? placa = stdin.readLineSync();

        stdout.write("Quantidade de Dias: ");
        String? diasLocacao = stdin.readLineSync();

        if (placa != null &&
            placa != "" &&
            diasLocacao != null &&
            diasLocacao != "") {
          double orcamento = estoque.orcamento(placa, int.parse(diasLocacao));
          if (orcamento > 0) {
            print("Valor: $orcamento");

            print("Confirmar locação?");
            String? confirmacao = stdin.readLineSync();
            if (confirmacao == "sim") estoque.locar(placa);
          } else {
            print("ERRO! VEÍCULO NÃO ENCONTRADO");
          }
        } else {
          print("ERRO! TODAS AS INFORMAÇÕES DEVEM SER VÁLIDAS!");
        }

      case "7":
        print("ORÇAMENTO COM DESCONTO");
        stdout.write("Placa: ");
        String? placa = stdin.readLineSync();

        stdout.write("Quantidade de Dias: ");
        String? diasLocacao = stdin.readLineSync();

        stdout.write("Desconto: ");
        String? desconto = stdin.readLineSync();

        if (placa != null &&
            placa != "" &&
            diasLocacao != null &&
            diasLocacao != "" &&
            desconto != null &&
            desconto != "") {
          double orcamento = estoque.orcamentoDesconto(
              placa, int.parse(diasLocacao), double.parse(desconto));
          if (orcamento > 0) {
            print("Valor: $orcamento");

            print("Confirmar locação?");
            String? confirmacao = stdin.readLineSync();
            if (confirmacao == "sim") estoque.locar(placa);

          } else {
            print("ERRO! VEÍCULO NÃO ENCONTRADO");
          }
        } else {
          print("ERRO! TODAS AS INFORMAÇÕES DEVEM SER VÁLIDAS!");
        }

      case "0":
        print("Saindo...");
        break;

      default:
        print("OPERAÇÃO INVÁLIDA!");
    }
  }
}
