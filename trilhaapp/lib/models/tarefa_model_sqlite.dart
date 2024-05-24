class TarefaSQLiteModel {
  int _id = 0;
  String _descricao = '';
  bool _concluido = false;

  TarefaSQLiteModel(this._id, this._descricao, this._concluido);

  factory TarefaSQLiteModel.empty() => TarefaSQLiteModel(-1, '', false);

  int get getId => _id;
  String get getDescricao => _descricao;
  bool get getConcluido => _concluido;

  void setId(int value) => _id = value;
  void setDescricao(String value) => _descricao = value;
  void setConcluido(bool value) => _concluido = value;

  @override
  String toString() => 'id:$_id, descricao:$_descricao, concluido:$_concluido';
}
