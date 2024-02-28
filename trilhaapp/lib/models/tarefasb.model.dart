class TarafaModelBack4app {
  List<TarefaModel> tarefas = [];

  TarafaModelBack4app(this.tarefas);

  TarafaModelBack4app.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaModel>[];
      json['results'].forEach((v) {
        tarefas.add(TarefaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();
    return data;
  }
}

class TarefaModel {
  String objectId = '';
  String descricao = '';
  bool concluido = false;
  String createdAt = '';
  String updatedAt = '';

  TarefaModel(this.objectId, this.descricao, this.concluido, this.createdAt,
      this.updatedAt);
  TarefaModel.save(
    this.descricao,
    this.concluido,
  );

  TarefaModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    descricao = json['descricao'];
    concluido = json['concluido'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    return data;
  }
}
