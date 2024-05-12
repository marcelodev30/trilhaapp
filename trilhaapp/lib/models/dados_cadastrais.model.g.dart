// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_cadastrais.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosCadastraisModelAdapter extends TypeAdapter<DadosCadastraisModel> {
  @override
  final int typeId = 0;

  @override
  DadosCadastraisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosCadastraisModel()
      ..nome = fields[0] as String?
      ..dataNacimento = fields[1] as DateTime?
      ..nivelSelecionado = fields[2] as String?
      ..linguagensSelecionado = (fields[3] as List).cast<String>()
      ..salario = fields[4] as double?
      ..tempoExperiencia = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, DadosCadastraisModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.dataNacimento)
      ..writeByte(2)
      ..write(obj.nivelSelecionado)
      ..writeByte(3)
      ..write(obj.linguagensSelecionado)
      ..writeByte(4)
      ..write(obj.salario)
      ..writeByte(5)
      ..write(obj.tempoExperiencia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosCadastraisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
