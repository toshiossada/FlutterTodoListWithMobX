import 'package:mobx_example/app/shared/services/local_storage_service.dart';
import 'package:mobx_example/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:mobx_example/app/app_widget.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LocalStorageService()),
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
