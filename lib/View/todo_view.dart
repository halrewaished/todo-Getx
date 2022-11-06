import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp/Controller/todo_controller.dart';

// import 'firebase_options.dart';
import 'package:todolistapp/test.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var addController = Get.put(todoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Todo List App",
            style: TextStyle(fontFamily: "Robot"),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    title: Text("Add new Todo"),
                    content: TextField(
                      onChanged: (String task) {
                        addController.addTodo(task);
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blueGrey),
                        ),
                        onPressed: () {
                          FirebaseManager.shared
                              .test(Test: addController.taskInput);
                          addController.todoList.add(addController.taskInput);
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'),
                      )
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: addController.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(addController.todoList[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(addController.todoList[index]),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      Checkbox(
                        value: false,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          addController.checkTodo(value!);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          addController.removeTodo(index);
                        },
                      ),
                    ]),
                  ),
                ),
              );
            },
          );
        }));
  }
}
