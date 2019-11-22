// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$listAtom = Atom(name: '_HomeBase.list');

  @override
  ObservableList<TodoModel> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableList<TodoModel> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$addAsyncAction = AsyncAction('add');

  @override
  Future add(TodoModel model) {
    return _$addAsyncAction.run(() => super.add(model));
  }

  final _$cleanAllAsyncAction = AsyncAction('cleanAll');

  @override
  Future cleanAll() {
    return _$cleanAllAsyncAction.run(() => super.cleanAll());
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future update(TodoModel model) {
    return _$updateAsyncAction.run(() => super.update(model));
  }

  final _$removeAsyncAction = AsyncAction('remove');

  @override
  Future remove(int id) {
    return _$removeAsyncAction.run(() => super.remove(id));
  }
}
