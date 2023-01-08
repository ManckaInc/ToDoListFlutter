import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Widgets/tasks_tile.dart';
import 'package:to_do_list/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});


  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
      return Dismissible(
        background: Container(
          color: Colors.red,
        ),
        key: ValueKey(task),
        onDismissed: (_){
          taskData.deleteTask(task);
        },
        child: TaskTile(
        taskTitle: task.name,
        isChecked: task.isDone,
        checkBoxCallBack: (bool? checkboxState) {
          taskData.updateTask(task);
        },
          longPressCallBack:(){
            taskData.deleteTask(task);
          },
        ),
      );
      },
      itemCount: taskData.taskCount,
      );
      },

    );
  }
}