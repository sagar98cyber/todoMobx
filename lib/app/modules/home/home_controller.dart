import 'package:fluterandotodoslidy/app/modules/models/todo_model.dart';
import 'package:fluterandotodoslidy/app/modules/repositories/todo_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repositories/todo_repository_interface.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;
  _HomeControllerBase(ITodoRepository this.repository) {
    getList();
  }

  @observable
  ObservableStream<List<TodoModel>> todoList;

  @action
  getList() {
    todoList = repository.getTodos().asObservable();
  }
}
