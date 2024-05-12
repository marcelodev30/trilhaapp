class ConfigModel {
  String _name;
  double _altura;
  bool _receberNotif;
  bool _modeDark;

  ConfigModel(this._name, this._altura, this._receberNotif, this._modeDark);

  factory ConfigModel.isEmpty() {
    return ConfigModel('', 0, false, false);
  }

  String get getName => _name;
  double get getAltura => _altura;
  bool get getReceberNotifi => _receberNotif;
  bool get getModeDark => _modeDark;

  void setName(String value) => _name = value;
  void setAltura(double value) => _altura = value;
  void setReceberNotifi(bool value) => _receberNotif = value;
  void setModeDark(bool value) => _modeDark = value;

  @override
  String toString() =>
      'Name: $_name, Altura:$_altura, ReceberNotif: $_receberNotif, ModeDark: $_modeDark';
}
