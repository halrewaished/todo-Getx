import 'package:get/get.dart';

class todoController extends GetxController {

  var todoList = [].obs;
  String taskInput = "";

  var check = false.obs;

  void addTodo(String value) {
    taskInput = value;
}

void removeTodo (int index){
    todoList.removeAt(index);
}

void checkTodo (value){
    check = value;
}
}