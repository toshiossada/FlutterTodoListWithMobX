import 'package:mobx/mobx.dart';
import 'package:mobx_example/app/shared/models/todo.model.dart';
import 'package:mobx_example/app/shared/services/local_storage_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  ObservableList<TodoModel> list = ObservableList<TodoModel>();
  @computed
  int get itemsTotal => list.length;
  @computed
  int get itemsTotalChecked => list.where((item) => item.check).length;

  final LocalStorageService localStorageService;

  _HomeBase(this.localStorageService) {
    _init();
  }

  _init() async {
    final allList = await localStorageService.getAll();
    list.addAll(allList);
  }

  @action
  add(TodoModel model) async {
    model = await localStorageService.add(model);
    list.add(model);
  }

  @action
  cleanAll() async {
    await localStorageService.clear();
    list.clear();
  }

  @action
  update(TodoModel model) async {
    await localStorageService.update(model);
  }

  @action
  remove(int id) async {
    await localStorageService.remove(id);
    list.removeWhere((item) => item.id == id);
  }
}
