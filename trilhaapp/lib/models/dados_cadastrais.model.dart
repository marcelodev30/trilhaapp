import 'package:hive/hive.dart';
part 'dados_cadastrais.model.g.dart';

@HiveType(typeId: 0)
class DadosCadastraisModel extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  DateTime? dataNacimento;

  @HiveField(2)
  String? nivelSelecionado;

  @HiveField(3)
  List<String> linguagensSelecionado = [];

  @HiveField(4)
  double? salario;

  @HiveField(5)
  int? tempoExperiencia;
}
