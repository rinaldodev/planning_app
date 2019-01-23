class Carta {
  static const zero = Carta('0', 'Essa história já está pronta!');
  static const meio = Carta('1/2', 'Excelente tamanho de história!');
  static const um = Carta('1', 'Excelente tamanho de história!');
  static const dois = Carta('2', 'Excelente tamanho de história!');
  static const tres = Carta('3', 'Excelente tamanho de história!');
  static const cinco = Carta('5', 'Bom tamanho de história.');
  static const oito = Carta('8', 'Bom tamanho de história.');
  static const treze =
      Carta('13', 'Considere quebrar essa história em partes menores.');
  static const vinte =
      Carta('20', 'Considere quebrar essa história em partes menores.');
  static const quarenta =
      Carta('40', 'Isso é um épico! Quebre em histórias menores.');
  static const cem =
      Carta('100', 'Isso é um épico! Quebre em histórias menores.');
  static const interrogacao =
      Carta('?', 'Melhor debatermos mais sobre essa história.');
  static const infinito = Carta('∞', 'É impossível fazer essa história.');
  static const cafe =
      Carta('☕', 'Acho que está na hora de fazermos uma pausa.');

  final String _valor;
  final String _sugestao;

  String get valor => _valor;
  String get sugestao => _sugestao;

  const Carta(this._valor, this._sugestao);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Carta &&
          runtimeType == other.runtimeType &&
          _valor == other._valor;

  @override
  int get hashCode => _valor.hashCode;
}
