import 'package:fluterandotodoslidy/app/modules/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          autofocus: true,
          onPressed: () {},
        ),
        body: Observer(
          builder: (_) {
            List<TodoModel> list = controller.todoList.data;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  TodoModel model = list[index];
                  if (controller.todoList.hasError) {
                    return Center(
                      child: Text('Error occured'),
                    );
                  }

                  if (controller.todoList.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CheckboxListTile(
                    title: Text(model.title),
                    value: model.check,
                    onChanged: (val) {
                      model.check = val;
                      model.save();
                    },
                  );
                });
          },
        ));
  }
}
