import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) onChanged;
  final VoidCallback onDelete; // Callback for delete
   final VoidCallback onEdit; // Callback for edit

  TaskTile({
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                decoration:
                    isDone ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit, // Call the onEdit callback when pressed
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete, // Call the onDelete callback when pressed
          ),
        ],
      ),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}
 