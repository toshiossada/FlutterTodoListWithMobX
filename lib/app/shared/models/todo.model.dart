import 'package:mobx/mobx.dart';

part 'todo.model.g.dart';

class TodoModel extends _TodoModel with _$TodoModel {
  TodoModel({id, title, check = false})
      : super(id: id, title: title, check: check);

  toJson() {
    return {"id": id, "title": title, "check": check};
  }

  factory TodoModel.fromJson(Map json) {
    return TodoModel(
        id: json['id'], title: json['title'], check: json['check']);
  }
}

abstract class _TodoModel with Store {
  int id;
  @observable
  String title;
  @observable
  bool check;

  _TodoModel({this.id, this.title = '', this.check = false});
}
