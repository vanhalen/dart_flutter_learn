class MinhaClasse {
  final int meuNumero;
  final String? meuTexto;

  MinhaClasse(this.meuNumero, {this.meuTexto});

  @override
  String toString() {
    return '$meuNumero - $meuTexto';
  }
}

void main() {
  int meuNumero = 5;

  var obj = MinhaClasse(meuNumero);

  print(obj);
}
