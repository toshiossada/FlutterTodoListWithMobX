import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/app/modules/home/components/item/item_widget.dart';
import 'package:mobx_example/app/modules/home/home_controller.dart';
import 'package:mobx_example/app/modules/home/home_module.dart';
import 'package:mobx_example/app/shared/models/todo.model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Todo List"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = HomeModule.to.bloc<HomeController>();

    _showDialog([TodoModel model]) {
      model = model ?? TodoModel();
      var titleCached = model.title;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(model.id != null ? 'Alterar' : 'Novo'),
              content: TextFormField(
                initialValue: model.title,
                maxLines: 5,
                onChanged: (v) => model.title = v,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    model.title = titleCached;
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if (model.id != null)
                      controller.update(model);
                    else
                      controller.add(model);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Observer(
              builder: (_) => Center(
                child: Text(
                  controller.itemsTotalChecked.toString(),
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              '/',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Observer(
              builder: (_) => Center(
                child: Text(
                  controller.itemsTotal.toString(),
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          ),
          onPressed: () {
            controller.cleanAll();
          },
        ),
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (_, index) {
              var model = controller.list[index];
              return ItemWidget(
                model: model,
                onPressed: () {
                  _showDialog(model);
                },
                onChanged: (v) {
                  model.check = v;
                  controller.update(model);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog();
        },
      ),
    );
  }
}
