import 'package:flutter/material.dart';
import 'package:statefull/components/task.dart';
//import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Curso de Flutter', 'assets/images/flut.webp', 3),
    Task('Curso de Inglês', 'assets/images/ing.jpg', 2),
    Task('Curso de Espanhol', 'assets/images/esp.jpg', 1),
    Task('Curso de Java', 'assets/images/jav.webp', 5),
  ];

  void newTask(String nome, String foto, int dificuldade) {
    taskList.add(Task(nome, foto, dificuldade));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  //fica de olho no estado da informação que estamos lidando
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
