import 'package:flutter/material.dart';
import 'package:to_do_list/Widgets/tasks_list.dart';
import 'package:to_do_list/Screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';


class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScreen(),
                      ),
                  ),
              );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.lightBlueAccent,
                  )
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text('Todoey',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),),
              Text('${Provider.of<TaskData>(context).taskCount} Tasks',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),),
            ],
          ),
        ),
          Expanded(
            child: Container(
              height: 300.0,
              decoration:  const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0),),
              ),
              child: const TasksList(),
            ),
          ),
    ],
      ),
    );
  }
}






