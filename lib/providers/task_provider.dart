import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

   void onDelete(String taskId) {
    _tasks.removeWhere((task) => task.id == taskId);
    notifyListeners();
  }

void onEdit(String taskId, String newTitle) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(
        id: _tasks[taskIndex].id,
        title: newTitle,
        isDone: _tasks[taskIndex].isDone,
      );
      notifyListeners();
    }
  }

}