class StringValidar {
  final String _value;

  StringValidar(this._value);

  String? validar() {
    if (_value.isEmpty) {
      return 'Campo nao pode ser vazio';
    } else {
      return null;
    }
  }

  @override
  String toString() => _value;
}
