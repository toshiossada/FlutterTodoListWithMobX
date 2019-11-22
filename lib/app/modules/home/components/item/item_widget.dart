import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/app/modules/home/home_module.dart';
import 'package:mobx_example/app/shared/models/todo.model.dart';

import '../../home_controller.dart';

class ItemWidget extends StatelessWidget {
  final TodoModel model;
  final Function onPressed;
  final Function onChanged;

  const ItemWidget({Key key, this.model, this.onPressed, this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          onTap: onPressed,
          leading: IconButton(
            icon: Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () {
              HomeModule.to.bloc<HomeController>().remove(model.id);
            },
          ),
          title: Text(model.title),
          trailing: Checkbox(value: model.check ?? false, onChanged: onChanged),
        );
      },
    );
  }
}
