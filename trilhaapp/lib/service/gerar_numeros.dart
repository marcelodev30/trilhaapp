import 'dart:math';

int gerarNumeroAleatorio(int numeroMaximo) {
  Random numeroAleatorio = Random();
  return numeroAleatorio.nextInt(numeroMaximo);
}
