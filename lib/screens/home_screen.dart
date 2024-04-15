import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          final tasks = taskProvider.tasks;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, index) {
              final task = tasks[index];
              return TaskTile(
                title: task.title,
                isDone: task.isDone,
                onChanged: (value) {
                  // Handle task completion
                },
                onDelete: () { // Provide the onDelete parameter
                  // Handle task deletion
                  tasksProvider.onDelete(task.id);
                },
                onEdit: () {
  final TextEditingController _textController =
      TextEditingController(text: task.title);

  // Show bottom sheet
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Edit Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: 'Enter new text'),
            ),
            SizedBox(height: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    final newText = _textController.text;
                    if (newText.isNotEmpty) {
                      tasksProvider.onEdit(task.id, newText);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
},



               
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
