import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{

  final List<Task> _tasks = [];

  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(String? newTaskTitle){
    final task = Task(name: newTaskTitle!);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}