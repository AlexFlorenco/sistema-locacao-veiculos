class Veiculo {
  String placa;
  String marca;
  String modelo;
  String anoFabricacao;
  bool estaDisponivel;
  double valorDiaria;

  Veiculo(this.placa, this.marca, this.modelo, this.anoFabricacao,
      this.estaDisponivel, this.valorDiaria);

  void exibirVeiculo() => print(
      "$marca $modelo $anoFabricacao\nPlaca: $placa\nDisponível:$estaDisponivel\nDiária:$valorDiaria\n");
}