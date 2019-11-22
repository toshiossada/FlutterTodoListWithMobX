import 'package:mobx_example/app/shared/models/todo.model.dart';

abstract class ILocalStorageService {
  Future<List<TodoModel>> getAll();
  Future<TodoModel> add(TodoModel model);
  update(TodoModel model);
  remove(int id);
}
