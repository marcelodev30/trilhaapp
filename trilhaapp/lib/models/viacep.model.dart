class ViaCepModel {
  String? _cep;
  String? _logradouro;
  String? _complemento;
  String? _bairro;
  String? _localidade;
  String? _uf;
  String? _ddd;

  ViaCepModel(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      String? ddd}) {
    if (cep != null) {
      this._cep = cep;
    }
    if (logradouro != null) {
      this._logradouro = logradouro;
    }
    if (complemento != null) {
      this._complemento = complemento;
    }
    if (bairro != null) {
      this._bairro = bairro;
    }
    if (localidade != null) {
      this._localidade = localidade;
    }
    if (uf != null) {
      this._uf = uf;
    }
    if (ddd != null) {
      this._ddd = ddd;
    }
  }

  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get complemento => _complemento;
  set complemento(String? complemento) => _complemento = complemento;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf;
  String? get ddd => _ddd;
  set ddd(String? ddd) => _ddd = ddd;

  ViaCepModel.fromJson(Map<String, dynamic> json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
    _ddd = json['ddd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this._cep;
    data['logradouro'] = this._logradouro;
    data['complemento'] = this._complemento;
    data['bairro'] = this._bairro;
    data['localidade'] = this._localidade;
    data['uf'] = this._uf;
    data['ddd'] = this._ddd;
    return data;
  }
}
