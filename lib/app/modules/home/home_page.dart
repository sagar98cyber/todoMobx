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
          child: Icon(Icons.add),
          onPressed: _showDailog,
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
                  return ListTile(
                    title: Text(model.title),
                    //value: model.check,
                    trailing: Checkbox(
                      value: model.check,
                      onChanged: (check) {
                        model.check = !model.check;
                        model.save();
                      },
                    ),
                    onTap: () {
                      _showDailog(model);
                    },
                  );
                });
          },
        ));
  }

  _showDailog([TodoModel model]) {
    model ??= TodoModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text('ToDo Details'),
              actions: [
                FlatButton(
                    onPressed: () async {
                      Modular.to.pop();
                    },
                    child: Icon(Icons.cancel)),
                FlatButton(
                    onPressed: () async {
                      await model.save();
                      Modular.to.pop();
                    },
                    child: Icon(Icons.check)),
              ],
              content: TextField(
                onChanged: (val) => model.title = val,
                decoration: InputDecoration(
                    labelText: 'aaaaa',
                    border: OutlineInputBorder(
                        //borderRadius: BorderRadius.all((Radius.circular(15)))
                        )),
              ));
        });
  }
}
