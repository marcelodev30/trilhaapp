//import 'package:trilhaapp/models/tarefasb.model.dart';
import 'package:trilhaapp/repositories/back4app/tarefas.back.repository.dart';

void main() async {
  var repository = TarefasBack4appRepository();

  //await repository.save(TarefaModel('', 'test', true, '', ''));
  //await repository.delete('0YxSZ1D6Ke');
  var dados = await repository.get();
  for (var element in dados.tarefas) {
    print('${element.objectId} - ${element.descricao} - ${element.concluido}');
   }
}
