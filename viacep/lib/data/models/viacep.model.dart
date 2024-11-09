class ViaCepModel {
  late String cep;
  late String logradouro;
  late String complemento;
  late String bairro;
  late String localidade;
  late String uf;
  late String ddd;

  ViaCepModel(
      {required this.cep,
      required this.logradouro,
      required this.bairro,
      required this.complemento,
      required this.localidade,
      required this.uf,
      required this.ddd});

  factory ViaCepModel.isEmpty() => ViaCepModel(
      cep: 'Sem Registo',
      logradouro: 'Sem Registo',
      bairro: 'Sem Registo',
      complemento: 'Sem Registo',
      localidade: 'Sem Registo',
      uf: 'Sem Registo',
      ddd: 'Sem Registo');

  ViaCepModel.fromJson(Map<String, dynamic> json) {
    json['cep'] != null ? cep = json['cep'] : cep = 'Sem Registo';
    json['bairro'] != null ? bairro = json['bairro'] : bairro = 'Sem Registo';
    json['uf'] != null ? uf = json['uf'] : uf = 'Sem Registo';
    json['ddd'] != null ? ddd = json['ddd'] : ddd = 'Sem Registo';

    json['logradouro'] != null
        ? logradouro = json['logradouro']
        : logradouro = 'Sem Registo';

    json['complemento'] != null
        ? complemento = json['complemento']
        : complemento = 'Sem Registo';

    json['localidade'] != null
        ? localidade = json['localidade']
        : localidade = 'Sem Registo';
  }

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'logradouro': logradouro,
        'complemento': complemento,
        'bairro': bairro,
        'localidade': localidade,
        'uf': uf,
        'ddd': ddd,
      };
}
